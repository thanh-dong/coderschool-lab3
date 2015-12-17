require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "#alphabetical" do
    it "should return products in alphabetical order" do
      prod1 = create(:product, name: "prodA")
      prod2 = create(:product, name: "prodB")
      prod3 = create(:product, name: "prodC")

      expect(subject.alphabetical).to eq [prod1, prod2, prod3]
    end
  end
end
