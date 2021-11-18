describe 'POST api/v1/listings', type: :request do
  let(:user) { create(:user) }
  let(:listing) { Listing.last }

  context 'when user is logged in' do
    subject { post api_v1_listings_path, params: params, headers: auth_headers, as: :json }

    let(:params) do
      {
        listing: {
          user: user
        }
      }
    end

    it 'returns a successful status code' do
      subject
      expect(response).to have_http_status(:success)
    end

    it 'creates the listing' do
      expect { subject }.to change(Listing, :count).from(0).to(1)
    end

    it 'returns the listing' do
      subject

      expect(json[:listing][:id]).to eq(listing.id)
      expect(json[:listing][:user][:first_name]).to eq(user.first_name)
      expect(json[:listing][:user][:last_name]).to eq(user.last_name)
      expect(json[:listing][:user][:email]).to eq(user.email)
    end
  end

  context 'when user is not logged in' do
    subject { post api_v1_listings_path, as: :json }

    it 'returns unauthorized status code' do
      subject
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
