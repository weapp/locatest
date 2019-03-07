class AddIndex < ActiveRecord::Migration[5.2]
  def change
    add_reference :hours, :venue, index: true
    add_foreign_key :hours, :venues
    add_index :hours,  [:venue_id, :day], unique: true
  end
end
