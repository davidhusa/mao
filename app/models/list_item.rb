class ListItem < ApplicationRecord
  belongs_to :card
  validates_presence_of :card
end
