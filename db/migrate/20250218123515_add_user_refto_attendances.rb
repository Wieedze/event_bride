class AddUserReftoAttendances < ActiveRecord::Migration[8.0]
  def change
    add_reference :attendances, :user, null:false , foreign_key: true 
  end
end
