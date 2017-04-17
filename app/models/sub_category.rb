class SubCategory < ActiveRecord::Base
  belongs_to :category
  has_many :sub_sub_categories, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
end
