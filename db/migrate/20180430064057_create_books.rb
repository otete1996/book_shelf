class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :name
      t.integer :price
      t.string :publish
      t.datetime :publish_date

      t.timestamps
    end
  end
end
