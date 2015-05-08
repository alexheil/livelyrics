class Album < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  belongs_to :artist
  has_many :lyrics, dependent: :destroy

  default_scope -> { order('year DESC') }

  validates :name, :uniqueness => {:scope => :artist_id}, presence: true, length: { maximum: 60 }
  validates :year, presence: true, length: { is: 4 }, numericality: { less_than_or_equal_to: 2016, greater_than: 1900}

  before_save :should_generate_new_friendly_id?

  private

    def should_generate_new_friendly_id?
      name_changed?
    end

    def slug_candidates
      [:name, [:name, :year], [:name, :year, :artist_id]]
    end

end
