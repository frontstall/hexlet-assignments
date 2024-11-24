# frozen_string_literal: true

require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get tasks_path

    assert_response :success
  end

  test 'should show task' do
    task = tasks(:one)

    get task_path(task)
    assert_response :success
    assert_select 'h1', task.name
  end

  test 'should delete task' do
    task = tasks(:one)

    assert_difference('Task.count', -1) do
      delete task_path(task)
    end

    assert_redirected_to tasks_path
  end
end
