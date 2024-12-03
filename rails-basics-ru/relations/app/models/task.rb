# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :status
  belongs_to :user

  before_validation :set_defaults, on: %i[create update]

  validates :name, presence: true
  validates_associated :status, :user

  private

  def set_defaults
    self.status_id ||= Status.first.id
  end
end
