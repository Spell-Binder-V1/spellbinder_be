class Card < ApplicationRecord
  has_many :deck_cards
  has_many :decks, through: :deck_cards

  validate :colors_is_an_array
  validate :color_identity_is_an_array
  validate :types_is_an_array
  validate :subtypes_is_an_array
  validate :rulings_is_an_array
  validates :name, presence: true
  validates :set_name, presence: true
  validates :multiverseid, presence: true
  validates :mana_cost, presence: true
  validates :converted_mana_cost, presence: true
  validates :type, presence: true
  validates :rarity, presence: true
  validates :set, presence: true
  validates :text, presence: true
  validates :artist, presence: true
  validates :number, presence: true
  validates :power, presence: true
  validates :toughness, presence: true
  validates :image_url, presence: true
  
  private

    def colors_is_an_array
      unless colors.is_a?(Array)
        errors.add(:colors, "must be an Array")
      end
    end

    def color_identity_is_an_array
      unless color_identity.is_a?(Array)
        errors.add(:color_identity, "must be an Array")
      end
    end

    def types_is_an_array
      unless types.is_a?(Array)
        errors.add(:types, "must be an Array")
      end
    end

    def subtypes_is_an_array
      unless subtypes.is_a?(Array)
        errors.add(:subtypes, "must be an Array")
      end
    end

    def rulings_is_an_array
      unless rulings.is_a?(Array)
        errors.add(:rulings, "must be an Array")
      end
    end
end