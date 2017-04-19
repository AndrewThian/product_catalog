class SubSubCategory < ActiveRecord::Base
  belongs_to :sub_category
  has_many :products, dependent: :destroy

  accepts_nested_attributes_for :products,
                       reject_if: proc { |attributes| attributes['name'].blank? },
                   allow_destroy: true

  validates :name, presence: true
  validates :name, uniqueness: true

  def sub_cat_data
    return { name: sub_category.name,
               id: sub_category.id }
  end
  def cat_data
    return { name: sub_category.category.name,
               id: sub_category.category.id }
  end
end
