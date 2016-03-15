require 'rails_helper'

RSpec.describe Brand, type: :model do
  fixtures :brands

  context "when validating" do
    let(:brand){ brands(:one) }

    it{ expect(brand).to validate_presence_of(:name) }
    it{ expect(brand).to validate_presence_of(:webmotors_id) }
    it{ expect(brand).to have_many(:models).inverse_of(:brand) }
  end
end