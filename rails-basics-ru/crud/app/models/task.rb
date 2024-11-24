# frozen_string_literal: true

class Task < ApplicationRecord
  before_validation :set_defaults, on: :create

  validates :name, :status, :creator, :performer, presence: true
  validates :completed, inclusion: [true, false]

  private

  def set_defaults
    self.completed ||= false
    self.status ||= 'opened'
  end
end
