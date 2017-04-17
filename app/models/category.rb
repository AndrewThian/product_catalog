class Category < ActiveRecord::Base
  has_many :sub_categories, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
end
