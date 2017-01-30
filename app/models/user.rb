class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username, use: :slugged

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :timeoutable
   #:omniauthable, :confirmable, :lockable

  scope :popular, -> {select("users.id, users.slug, users.username, count(lyrics.id) lyrics_count").joins(:lyrics).group("users.id").reorder("lyrics_count desc").limit(10)}

  has_many :lyrics
  has_many :comments, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }, format: { with: /\A[a-zA-Z0-9 ]+\Z/i }

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
