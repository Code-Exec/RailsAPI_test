require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)

    proj = Project.new( { name: 'TestProj' } )
    proj.save

    @task_url_new = "/projects/#{proj.id}/tasks/"
    @task_url = "/projects/#{proj.id}/tasks/#{@task.id}"
  end

  test "should get index" do
    get @task_url, as: :json
    assert_response :success
  end

  test "should create task" do
    
    assert_difference('Task.count') do
      post @task_url_new, params: { name: 'TestTask' }, as: :json
    end

    assert_response 201
  end

  test "should show task" do
    get @task_url, as: :json
    assert_response :success
  end

  test "should update task" do
    patch @task_url, params: { id: @task.id, name: 'TestTask2' }, as: :json
    assert_response 200
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete @task_url, as: :json
    end

    assert_response 204
  end
end
