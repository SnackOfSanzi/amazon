class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string           :name, null: false, index: true
      t.decimal          :price, null: false
      t.text             :description
      t.integer          :stock
      t.timestamps
    end
  end
end
