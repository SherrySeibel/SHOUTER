require 'rails_helper'

RSpec.describe TextShout, type: :model do
  it { should validate_presence_of(:body) }
  it { should_not allow_value("", nil).for(:body) }

  it { should have_one(:shout).dependent(:destroy) }

  describe "#upcase_body" do
    it "Forces the text to all capital letters" do
      text_shout = TextShout.create(body: "hello")

      expect(text_shout.body).to eq "HELLO"
    end
  end
end
