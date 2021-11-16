require 'rails_helper'

RSpec.describe "Listings", type: :request do

  describe "Listings" do
    let(:user) { create(:user) }
    let!(:listing_1) { create(:listing, user: user) }
    let!(:listing_2) { create(:listing, user: user) }

    subject { get api_v1_listings_path, headers: auth_headers, as: :json }

    it 'Get all listings' do
      subject

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end
end
