require "rails_helper"

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should_not allow_value("", nil).for(:email) }
  it { should validate_uniqueness_of(:email) }

  it { should validate_presence_of(:username) }
  it { should_not allow_value("", nil).for(:username) }
  it { should validate_uniqueness_of(:username) }

  it { should validate_presence_of(:password_digest) }

  it { should have_many(:shouts).dependent(:destroy) }
end
