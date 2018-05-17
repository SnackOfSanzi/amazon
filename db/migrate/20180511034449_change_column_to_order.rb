class ChangeColumnToOrder < ActiveRecord::Migration[5.0]
  def change

    def up
      t.date          :shipping_date
    end


    def down
      t.date          :shipping_date, null: false
  end
end
end
