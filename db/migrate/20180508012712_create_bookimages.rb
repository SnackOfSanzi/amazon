class CreateBookimages < ActiveRecord::Migration[5.0]
  def change
    create_table :bookimages do |t|
      t.string         :title,  foreign_key: true
      t.text           :image_url
      t.references     :product, foreign_key: true
      t.timestamps
    end
  end
end
