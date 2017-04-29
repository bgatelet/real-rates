class Currency < ApplicationRecord
  has_many   :list_currencies
  has_many   :lists, through: :list_currencies

  validates_presence_of :code, :rate
end
