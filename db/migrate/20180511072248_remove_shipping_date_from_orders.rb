class RemoveShippingDateFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :shipping_date, :date
  end
end
