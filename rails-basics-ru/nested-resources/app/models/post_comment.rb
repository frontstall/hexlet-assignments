# == Schema Information
#
# Table name: post_comments
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer          not null
#
# Indexes
#
#  index_post_comments_on_post_id  (post_id)
#
# Foreign Keys
#
#  post_id  (post_id => posts.id)
#
class PostComment < ApplicationRecord
  belongs_to :post, dependent: :destroy

  validates :body, presence: true, length: { minimum: 5, maximum: 300 }
end
