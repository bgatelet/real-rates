require 'rails_helper'

RSpec.describe List, type: :model do
  subject { build(:list) }

  it { should belong_to(:user) }
  it { should have_many(:list_currencies) }
  it { should have_many(:currencies).through(:list_currencies) }

  it { should validate_presence_of(:base_currency) }
end
