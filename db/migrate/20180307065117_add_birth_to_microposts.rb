class AddBirthToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_column :microposts, :birth, :date
  end
end
