class GridCell < ApplicationRecord
  belongs_to :grid_row
  validates_presence_of :grid_row

end
