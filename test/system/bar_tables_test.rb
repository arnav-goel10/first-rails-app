require "application_system_test_case"

class BarTablesTest < ApplicationSystemTestCase
  setup do
    @bar_table = bar_tables(:one)
  end

  test "visiting the index" do
    visit bar_tables_url
    assert_selector "h1", text: "Bar tables"
  end

  test "should create bar table" do
    visit bar_tables_url
    click_on "New bar table"

    fill_in "Email", with: @bar_table.email
    fill_in "First name", with: @bar_table.first_name
    fill_in "Last name", with: @bar_table.last_name
    fill_in "Phone", with: @bar_table.phone
    fill_in "Twitter", with: @bar_table.twitter
    click_on "Create Bar table"

    assert_text "Bar table was successfully created"
    click_on "Back"
  end

  test "should update Bar table" do
    visit bar_table_url(@bar_table)
    click_on "Edit this bar table", match: :first

    fill_in "Email", with: @bar_table.email
    fill_in "First name", with: @bar_table.first_name
    fill_in "Last name", with: @bar_table.last_name
    fill_in "Phone", with: @bar_table.phone
    fill_in "Twitter", with: @bar_table.twitter
    click_on "Update Bar table"

    assert_text "Bar table was successfully updated"
    click_on "Back"
  end

  test "should destroy Bar table" do
    visit bar_table_url(@bar_table)
    click_on "Destroy this bar table", match: :first

    assert_text "Bar table was successfully destroyed"
  end
end
