class Lyric < ActiveRecord::Base

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  belongs_to :artist
  belongs_to :album
  belongs_to :user

  has_many :comments, dependent: :destroy

  default_scope -> { order('track_number') }

  validates :track_name, :uniqueness => {:scope => :album_id}, presence: true, length: { maximum: 80 }
  validates :track_number, :uniqueness => {:scope => :album_id}, presence: true, length: { maximum: 2 }, numericality: { less_than_or_equal_to: 99, greater_than: 0}
  validates :lyrics, presence: true, length: { maximum: 10000 }
  validates :slug, presence: true, :uniqueness => {:scope => :album_id}

  before_save :should_generate_new_friendly_id?

  private

    def should_generate_new_friendly_id?
      track_name_changed?
    end

    def slug_candidates
      [:track_name, [:track_number, :track_name], [:track_number, :track_name, :album_id]]
    end

end
