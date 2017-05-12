class ListCurrency < ApplicationRecord
  belongs_to :list, counter_cache: :currencies_count
  belongs_to :currency
end
