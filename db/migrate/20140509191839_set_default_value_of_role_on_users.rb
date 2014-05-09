class SetDefaultValueOfRoleOnUsers < ActiveRecord::Migration
  def change
    change_column :users, :role, :string, :default => 'commenter'
  end
end
