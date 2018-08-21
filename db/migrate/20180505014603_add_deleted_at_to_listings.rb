class AddDeletedAtToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :deleted_at, :datetime
  end
end
