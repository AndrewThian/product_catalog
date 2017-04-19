class SubCategory < ActiveRecord::Base
  belongs_to :category
  has_many :sub_sub_categories, dependent: :destroy

  accepts_nested_attributes_for :sub_sub_categories,
                       reject_if: proc { |attributes| attributes['name'].blank? },
                   allow_destroy: true

  validates :name, presence: true
  validates :name, uniqueness: true

  def cat_name
    return category.name
  end
end
