class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text                :body,null:false
      t.integer             :rate
      t.text                :avatar
      t.text                :mainsubject,null: false
      t.references          :product,null: false, foreign_key: true
      t.references
      t.timestamps
    end
  end
end
