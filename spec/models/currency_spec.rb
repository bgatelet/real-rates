require 'rails_helper'

RSpec.describe Currency, type: :model do
  subject { build(:currency) }

  it { should validate_presence_of(:code) }
  it { should validate_presence_of(:rate) }

  it { should have_many(:list_currencies) }
  it { should have_many(:lists).through(:list_currencies) }
end
