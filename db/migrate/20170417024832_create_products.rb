class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.references :sub_sub_category, index: true
      t.decimal :price
      t.string :thumb_img

      t.timestamps null: false
    end
    add_foreign_key :products, :sub_sub_categories
  end
end
