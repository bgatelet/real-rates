require 'rails_helper'

RSpec.describe ListCurrency, type: :model do
  subject { build(:list_currency) }

  it { should belong_to(:list) }
  it { should belong_to(:currency) }
end
