require 'rails_helper'

describe 'GET api/v1/listings/:id', type: :request do
  let(:user) { create(:user) }
  let!(:listing) { create(:listing, user: user) }
  let(:listing_id) { listing.id }

  subject { get api_v1_listing_path(listing_id), headers: headers, as: :json }

  context 'when user is logged in' do
    let(:headers) { auth_headers }

    context 'when the listing id exists' do
      it 'returns a successful status code' do
        subject
        expect(response).to have_http_status(:success)
      end
  
      it 'returns the listing' do
        subject
  
        expect(json[:listing][:id]).to eq(listing.id)
        expect(json[:listing][:user][:first_name]).to eq(user.first_name)
        expect(json[:listing][:user][:last_name]).to eq(user.last_name)
        expect(json[:listing][:user][:email]).to eq(user.email)
      end
    end

    context 'when the listing id does not exist' do
      let(:listing_id) { 'missing_id' }
      it 'returns a not found status code' do
        subject
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  context 'when user is not logged in' do
    let(:headers) { {} }

    it 'returns unauthorized status code' do
      subject
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
