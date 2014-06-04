class ChangeShowAgeOnBooleanToFalseAsDefault < ActiveRecord::Migration
  def change
    change_column :users, :show_age, :boolean, default: false
  end
end
