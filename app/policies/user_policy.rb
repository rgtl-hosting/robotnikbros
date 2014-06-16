class UserPolicy < ApplicationPolicy

  def safe_attributes
    [
      :name,
      :email,
      :password,
      :password_confirmation,
      :birth_date,
      :show_age,
      :role,
    ]
  end
end
