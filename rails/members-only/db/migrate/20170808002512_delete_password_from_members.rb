class DeletePasswordFromMembers < ActiveRecord::Migration[5.1]
  def change
  	remove_column :members, :password
  	add_column :members, :password_digest, :string
  end
end
