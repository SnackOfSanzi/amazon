class ChangeColumnToOrderProduct < ActiveRecord::Migration[5.0]
  def change

  def up
    change_column :order_products, :quantity, :integer, default: 0
  end

  def down
    change_column :order_products, :quantity, :integer
  end
  end
end
