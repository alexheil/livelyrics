class Comment < ActiveRecord::Base
  belongs_to :lyric
  belongs_to :user

  validates :content, presence: true, length: { maximum: 1000 }
  validates :user_id, presence: true
  validates :lyric_id, presence: true
end
