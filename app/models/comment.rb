class Comment < ApplicationRecord
  belongs_to :user
  validates_presence_of :user
  validates :title, presence: true

  private
  after_initialize :set_defaults
  def set_defaults
    self.title ||= ''
  end
end
