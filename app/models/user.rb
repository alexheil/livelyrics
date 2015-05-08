class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username, use: :slugged

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :timeoutable
   #:omniauthable

  has_many :lyrics
  has_many :comments, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }, format: { with: /\A[\S]+\Z/i }

  before_save :should_generate_new_friendly_id?, if: :username_changed?
  before_save :downcase_username

  private

    def should_generate_new_friendly_id?
      username_changed?
    end

    def downcase_username
      self.username = username.downcase
    end

end
