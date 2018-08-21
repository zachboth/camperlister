class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.integer :year
      t.string :make
      t.string :model
      t.float :price
      t.integer :user_id

      t.timestamps
    end
  end
end
