# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :text
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
  # BEGIN
  has_many :post_comments
  # END

  validates :title, presence: true
  validates :body, length: { maximum: 500 }
end
