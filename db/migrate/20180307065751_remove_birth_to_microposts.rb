class RemoveBirthToMicroposts < ActiveRecord::Migration[5.0]
  def change
    remove_column :microposts, :birth, :date
  end
end
