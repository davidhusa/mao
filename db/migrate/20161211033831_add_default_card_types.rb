class AddDefaultCardTypes < ActiveRecord::Migration[5.0]
  class CardType < ApplicationRecord ; end

  CARD_TYPES = ["RULES", "ITEM", "WEAPON", 
   "BASIC ACTION", "MOVEMENT ACTION", "MELEE ACTION", 
   "SKILL", "MELEE SKILL", "STUNT", "STATUS EFFECT",
   "CONDITION"]
   
  def up
    CARD_TYPES.each do |ct|
      CardType.find_or_create_by(name: ct)
    end
  end

  def down
    CARD_TYPES.each do |ct|
      CardType.find_by(name: ct).map(&:destroy)
    end
  end
end
