class AddShowAgeBooleanToUsers < ActiveRecord::Migration
  def change
    add_column :users, :show_age, :boolean, default: true
  end
end
