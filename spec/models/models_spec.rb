require 'rails_helper'

RSpec.describe Model, type: :model do
  fixtures :brands, :models

  context "when validating" do
    let(:brand){ models(:one) }

    it{ expect(brand).to validate_presence_of(:name) }
    it{ expect(brand).to validate_presence_of(:webmotors_id) }
    it{ expect(brand).to validate_presence_of(:brand) }
    it{ expect(brand).to belong_to(:brand).inverse_of(:models) }
  end
end