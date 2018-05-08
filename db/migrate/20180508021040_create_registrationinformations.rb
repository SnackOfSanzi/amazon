class CreateRegistrationinformations < ActiveRecord::Migration[5.0]
  def change
    create_table :registrationinformations do |t|
      t.string          :isbn,null: false, foreign_key: true
      t.string          :pubiilsher
      t.date            :saledate
      t.string          :language
      t.string          :determinetype
      t.references      :product, foreign_key: true
      t.timestamps
    end
  end
end
