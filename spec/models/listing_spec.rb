require 'rails_helper'

RSpec.describe Listing, type: :model do
  let(:user) {create(:user)}

  describe 'associations' do
    subject { build(:listing, user: user) }
  
    it { is_expected.to belong_to(:user) }
  end
end
