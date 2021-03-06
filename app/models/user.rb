class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Knock needs an authenticate method.
  alias_method :authenticate, :valid_password?

  has_one :list
  accepts_nested_attributes_for :list

  validates :email, presence: true
end
