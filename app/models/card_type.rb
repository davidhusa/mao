class CardType < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  BASIC = ["STATUS EFFECT", "CONDITION", "RULES", "ITEM", "WEAPON",
    "BASIC ACTION", "MOVEMENT ACTION", "MELEE ACTION", "SKILL", 
    "MELEE SKILL", "STUNT"]

  private
  after_initialize :set_defaults
  def set_defaults
    self.description ||= ''
  end
end
