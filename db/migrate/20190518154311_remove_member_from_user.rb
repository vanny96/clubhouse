class RemoveMemberFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :member, :boolean
  end
end
