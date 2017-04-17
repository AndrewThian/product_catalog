class Product < ActiveRecord::Base
  belongs_to :sub_sub_category

  validates :name, :price, presence: true
  validates :name, uniqueness: true
  validates :price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0 }
end
