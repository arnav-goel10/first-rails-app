class BarTablesController < ApplicationController
  before_action :set_bar_table, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /bar_tables or /bar_tables.json
  def index
    @bar_tables = BarTable.all
  end

  # GET /bar_tables/1 or /bar_tables/1.json
  def show
  end

  def correct_user
    @bar_table = current_user.bar_tables.find_by(id: params[:id])
    redirect_to bar_tables_path, notice: "Not authorized to edit this bar table" if @bar_table.nil?
  end

  # GET /bar_tables/new
  def new
    #@bar_table = BarTable.new
    @bar_table = current_user.bar_tables.build
  end

  # GET /bar_tables/1/edit
  def edit
  end

  # POST /bar_tables or /bar_tables.json
  def create
    #@bar_table = BarTable.new(bar_table_params)
    @bar_table = current_user.bar_tables.build(bar_table_params)
    respond_to do |format|
      if @bar_table.save
        format.html { redirect_to bar_table_url(@bar_table), notice: "Bar table was successfully created." }
        format.json { render :show, status: :created, location: @bar_table }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bar_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bar_tables/1 or /bar_tables/1.json
  def update
    respond_to do |format|
      if @bar_table.update(bar_table_params)
        format.html { redirect_to bar_table_url(@bar_table), notice: "Bar table was successfully updated." }
        format.json { render :show, status: :ok, location: @bar_table }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bar_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bar_tables/1 or /bar_tables/1.json
  def destroy
    @bar_table.destroy!

    respond_to do |format|
      format.html { redirect_to bar_tables_url, notice: "Bar table was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bar_table
      @bar_table = BarTable.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bar_table_params
      params.require(:bar_table).permit(:first_name, :last_name, :email, :phone, :twitter,:user_id)
    end
end
