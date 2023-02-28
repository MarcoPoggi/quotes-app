class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable

  belongs_to :company

  validates :email, presence: true

  def name #decorator?
    "@#{email.split("@").first.split("+").first.downcase}"
  end
end
