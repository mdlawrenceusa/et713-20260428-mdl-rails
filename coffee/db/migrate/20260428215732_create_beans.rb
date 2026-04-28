class CreateBeans < ActiveRecord::Migration[8.1]
  def change
    create_table :beans do |t|
      t.references :supplier, null: false, foreign_key: true
      t.string :type
      t.string :product_name
      t.decimal :price
      t.text :description
      t.integer :quantity

      t.timestamps
    end
  end
end
