class Category < ActiveRecord::Base
  has_many :sub_categories, dependent: :destroy

  accepts_nested_attributes_for :sub_categories,
                       reject_if: proc { |attributes| attributes['name'].blank? },
                   allow_destroy: true

  validates :name, presence: true
  validates :name, uniqueness: true
end
