class Listing < ApplicationRecord
  belongs_to :user
  has_many :photos

  def soft_delete
    update(deleted_at: DateTime.now)
  end
end
