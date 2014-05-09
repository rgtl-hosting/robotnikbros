class SetDefaultValueOfRoleOnUsers < ActiveRecord::Migration
  def change
    update_column :users, :role, :string, :default => 'commenter'
  end
end
