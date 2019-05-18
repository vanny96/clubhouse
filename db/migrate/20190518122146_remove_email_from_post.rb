class RemoveEmailFromPost < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :email, :string
  end
end
