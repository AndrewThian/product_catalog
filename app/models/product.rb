class Product < ActiveRecord::Base
  belongs_to :sub_sub_category

  validates :name, :price, presence: true
  validates :name, uniqueness: true
  validates :price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0 }

  def sub_sub_cat_data
    return { name: sub_sub_category.name,
               id: sub_sub_category.id }
  end

  def sub_cat_data
    return { name: sub_sub_category.sub_category.name,
               id: sub_sub_category.sub_category.id }
  end

  def cat_data
    return { name: sub_sub_category.sub_category.category.name,
               id: sub_sub_category.sub_category.category.id }
  end
end
