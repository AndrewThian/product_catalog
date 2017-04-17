class SubSubCategory < ActiveRecord::Base
  belongs_to :sub_category
  has_many :products, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
end
