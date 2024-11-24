# frozen_string_literal: true

require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test 'validation' do
    tasks(
      :task_without_name,
      :task_without_status,
      :task_without_creator,
      :task_without_performer,
      :task_without_completed
    ).each do |t|
      assert_not t.save, 'Saved invalid task'
    end
  end
end
