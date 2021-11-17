describe 'GET api/v1/listings/:id', type: :request do
  let(:email)                 { 'test@test.com' }
  let(:first_name)            { 'usu' }
  let(:last_name)             { 'ario' }
  let!(:api_v1_listing_path)   { '/api/v1/listings/' }

  let(:user) { create(:user, first_name: first_name, email: email, last_name: last_name) }
  let!(:listing) { create(:listing, user: user) }

  context 'When user is logged in' do

    subject { get "#{api_v1_listings_path}/#{listing.id}", headers: auth_headers, as: :json }

    it 'returns a successful response' do
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

  context 'When user is not logged in' do
    subject { get "#{api_v1_listings_path}/#{listing.id}", as: :json }

    it 'returns unauthorized' do
      subject
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
