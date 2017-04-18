class SubSubCategory < ActiveRecord::Base
  belongs_to :sub_category
  has_many :products, dependent: :destroy

  accepts_nested_attributes_for :products,
                       reject_if: proc { |attributes| attributes['name'].blank? },
                   allow_destroy: true

  validates :name, presence: true
  validates :name, uniqueness: true

  def sub_cat_parent_name
    return sub_category.name
  end
end
