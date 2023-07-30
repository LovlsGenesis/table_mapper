require "application_system_test_case"

module DatabasePlanner
  class PlanDatabasesTest < ApplicationSystemTestCase
    setup do
      @plan_database = database_planner_plan_databases(:one)
    end

    test "visiting the index" do
      visit plan_databases_url
      assert_selector "h1", text: "Plan databases"
    end

    test "should create plan database" do
      visit plan_databases_url
      click_on "New plan database"

      click_on "Create Plan database"

      assert_text "Plan database was successfully created"
      click_on "Back"
    end

    test "should update Plan database" do
      visit plan_database_url(@plan_database)
      click_on "Edit this plan database", match: :first

      click_on "Update Plan database"

      assert_text "Plan database was successfully updated"
      click_on "Back"
    end

    test "should destroy Plan database" do
      visit plan_database_url(@plan_database)
      click_on "Destroy this plan database", match: :first

      assert_text "Plan database was successfully destroyed"
    end
  end
end
