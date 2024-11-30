class Post < ApplicationRecord
  before_validation :set_defaults, on: :create

  validates :title, :summary, :body, presence: true
  validates :published, inclusion: [true, false]

  private

  def set_defaults
    self.published ||= false
  end
end
