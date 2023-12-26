require "test_helper"

class BarTablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bar_table = bar_tables(:one)
  end

  test "should get index" do
    get bar_tables_url
    assert_response :success
  end

  test "should get new" do
    get new_bar_table_url
    assert_response :success
  end

  test "should create bar_table" do
    assert_difference("BarTable.count") do
      post bar_tables_url, params: { bar_table: { email: @bar_table.email, first_name: @bar_table.first_name, last_name: @bar_table.last_name, phone: @bar_table.phone, twitter: @bar_table.twitter } }
    end

    assert_redirected_to bar_table_url(BarTable.last)
  end

  test "should show bar_table" do
    get bar_table_url(@bar_table)
    assert_response :success
  end

  test "should get edit" do
    get edit_bar_table_url(@bar_table)
    assert_response :success
  end

  test "should update bar_table" do
    patch bar_table_url(@bar_table), params: { bar_table: { email: @bar_table.email, first_name: @bar_table.first_name, last_name: @bar_table.last_name, phone: @bar_table.phone, twitter: @bar_table.twitter } }
    assert_redirected_to bar_table_url(@bar_table)
  end

  test "should destroy bar_table" do
    assert_difference("BarTable.count", -1) do
      delete bar_table_url(@bar_table)
    end

    assert_redirected_to bar_tables_url
  end
end
