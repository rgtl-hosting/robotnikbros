class User < ActiveRecord::Base
  ROLES = [
    ADMIN_ROLE = 'admin',
    AUTHOR_ROLE = 'author',
    COMMENTER_ROLE = 'commenter',
  ]

  before_save { self.email = email.downcase }
  before_create :create_remember_token
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }, on: :create

  has_many :comments
  has_many :posts

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  ROLES.each do |role_name|
    define_method "#{role_name}?" do
      role == role_name
    end
  end

  def has_role?(*roles)
    return false if roles.blank?
    roles.include?(role.to_sym)
  end

  def age
    if !birth_date.blank?
      "#{(Time.zone.now.to_date - birth_date.to_date).to_i / 365} Years Old"
    else
      "Immortal"
    end
  end

  private

    def create_remember_token
      self.remember_token = User.hash(User.new_remember_token)
    end
end
