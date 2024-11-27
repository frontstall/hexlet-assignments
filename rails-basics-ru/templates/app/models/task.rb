# frozen_string_literal: true

class Task < ApplicationRecord
  validates :name, :creator, :status, presence: true
  validates :completed, inclusion: { in: [true, false] }

  before_validation :set_defaults, on: :create

  private

  def set_defaults
    self.completed ||= false
    self.status ||= :opened
  end
end
