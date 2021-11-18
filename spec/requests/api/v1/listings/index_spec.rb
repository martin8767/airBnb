require 'rails_helper'

describe "GET api/v1/listings", type: :request do
  let(:user) { create(:user) }
  let!(:listing_1) { create(:listing, user: user) }
  let!(:listing_2) { create(:listing, user: user) }

  context 'when user is logged in' do
    subject { get api_v1_listings_path, headers: auth_headers, as: :json }

    it 'returns success status code' do
      subject
      expect(response).to have_http_status(:success)
    end

    it 'returns all listings' do
      subject
      expect(json[:listing].size).to eq(2)
    end
  end

  context 'when user is not logged in' do
    subject { get api_v1_listings_path, as: :json }

    it 'returns unauthorized status code' do
      subject
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
