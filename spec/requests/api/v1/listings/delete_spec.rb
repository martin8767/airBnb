describe 'DELETE api/v1/listings', type: :request do
  let(:user) { create(:user) }
  let!(:listing) { create(:listing, user: user) }

  let!(:api_v1_listing_path)   { "/api/v1/listings/#{listing.id}" }

  context 'when user is logged in' do
    subject { delete api_v1_listing_path, headers: auth_headers, as: :json }

    let(:params) do
      {
        listing: {
          user: user
        }
      }
    end

    it 'returns a successful status code' do
      subject
      expect(response).to have_http_status(:no_content)
    end

    it 'deletes the listing' do
      expect { subject }.to change(Listing, :count).from(1).to(0)
    end
  end

  context 'when user is not logged in' do
    subject { put api_v1_listing_path, as: :json }

    it 'returns unauthorized status code' do
      subject
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
