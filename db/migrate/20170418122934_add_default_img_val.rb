class AddDefaultImgVal < ActiveRecord::Migration
  def change
    change_column_default :products, :thumb_img, "http://placehold.it/200x200"
  end
end
