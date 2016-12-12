class Card < ApplicationRecord
  belongs_to :user
  belongs_to :card_type
  validates_presence_of :user
  validates_presence_of :card_type
  validates :name, presence: true, uniqueness: true
  validates :cost, inclusion: { in: 0..9 }
  has_many :list_items, dependent: :destroy
  has_many :grid_rows, dependent: :destroy

  def update_list_items(new_list_items)
    new_list_items ||= []
    old_list_items = self.list_items
    ActiveRecord::Base.transaction do
      old_list_items.map(&:destroy)
      new_list_items.values.each_with_index do |text, i|
        next if text.blank?
        ListItem.create(description: text, card: self, position: i)
      end
      @success = true
    end
    return @success
  end

  private
  after_initialize :set_defaults
  def set_defaults
    self.cost ||= 0
    self.description ||= ''
    self.quote ||= ''
  end

  before_save :fix_capitalization_if_applicable
  def fix_capitalization_if_applicable
    unless self.name.match(/[A-Z0-9]/)
      self.name = self.name.split(' ').map(&:capitalize).join(' ')
    end
  end

  before_create :add_quick_ref
  def add_quick_ref
    return unless self.quick_ref.blank?
    self.quick_ref = self.name.gsub(/[^A-Z0-9]/,'')[0..3]
    if self.quick_ref.blank?
      self.quick_ref = self.name.gsub(/[^A-Z0-9]/,'')[0..3]
    end
    self.quick_ref = self.quick_ref + "%02d" % rand(0..99)
  end
end
