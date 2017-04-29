class ListCurrency < ApplicationRecord
  belongs_to :list
  belongs_to :currency
end
