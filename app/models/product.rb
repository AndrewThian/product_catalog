class Product < ActiveRecord::Base
  belongs_to :sub_sub_category

  validates :name, presence: true
  validates :name, uniqueness: true
end
