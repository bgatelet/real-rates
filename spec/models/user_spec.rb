require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  it { should validate_presence_of(:email) }

  it { should have_many(:lists) }
end
