class User < ApplicationRecord
  devise :database_authenticatable, :validatable

  belongs_to :company

  def name #decorator?
    "@#{email.split("@").first.split("+").first.downcase}"
  end
end
