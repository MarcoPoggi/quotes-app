class User < ApplicationRecord
  VALID_EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_PASSWORD_REGEXP = /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}\z/

  # --- RELATIONSHIP
  devise :database_authenticatable, :registerable, :recoverable
  belongs_to :company

  # --- VALIDATIONS
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 8 },
                       format: { with: VALID_PASSWORD_REGEXP, message: "must contains least one(number, lower case, capital letter)" },
                       confirmation: true

  # --- METHODS
  def name #decorator?
    "@#{email.split("@").first.split("+").first.downcase}"
  end
end
