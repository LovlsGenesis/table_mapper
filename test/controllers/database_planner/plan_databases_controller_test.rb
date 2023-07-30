require "test_helper"

module DatabasePlanner
  class PlanDatabasesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @plan_database = database_planner_plan_databases(:one)
    end

    test "should get index" do
      get plan_databases_url
      assert_response :success
    end

    test "should get new" do
      get new_plan_database_url
      assert_response :success
    end

    test "should create plan_database" do
      assert_difference("PlanDatabase.count") do
        post plan_databases_url, params: { plan_database: {  } }
      end

      assert_redirected_to plan_database_url(PlanDatabase.last)
    end

    test "should show plan_database" do
      get plan_database_url(@plan_database)
      assert_response :success
    end

    test "should get edit" do
      get edit_plan_database_url(@plan_database)
      assert_response :success
    end

    test "should update plan_database" do
      patch plan_database_url(@plan_database), params: { plan_database: {  } }
      assert_redirected_to plan_database_url(@plan_database)
    end

    test "should destroy plan_database" do
      assert_difference("PlanDatabase.count", -1) do
        delete plan_database_url(@plan_database)
      end

      assert_redirected_to plan_databases_url
    end
  end
end
