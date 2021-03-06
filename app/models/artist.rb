class Artist < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  has_many :albums, dependent: :destroy
  has_many :lyrics, dependent: :destroy

  default_scope -> { order('artist_name') }

  validates :artist_name, presence: true, uniqueness: true, length: { maximum: 40 }
  validates :artist_facebook, format: { with: /\A((http|https)?:\/\/)?(www.)?(facebook|noisaea).com\//i  }, allow_blank: true

  before_save :smart_add_url_protocol
  before_save :downcase_url
  before_save :should_generate_new_friendly_id?, if: :artist_name_changed?

  def self.search(search)
    where("artist_name iLIKE ?", "%#{search}%")
  end

  private

    def smart_add_url_protocol
      unless self.artist_facebook[/\Ahttp:\/\//] || self.artist_facebook[/\Ahttps:\/\//]
        self.artist_facebook = "https://#{self.artist_facebook}" unless artist_facebook.blank?
      end
    end

    def downcase_url
      self.artist_facebook = artist_facebook.downcase
    end

    def should_generate_new_friendly_id?
      artist_name_changed?
    end

    def slug_candidates
      [:artist_name, [:artist_name, :id]]
    end

end
