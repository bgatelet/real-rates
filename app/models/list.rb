class List < ApplicationRecord
  belongs_to :user
  has_many   :list_currencies
  has_many   :currencies, through: :list_currencies
end
