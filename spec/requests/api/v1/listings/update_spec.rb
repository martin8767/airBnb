describe 'PUT api/v1/listings', type: :request do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let!(:listing) { create(:listing, user: user, price_per_night: 12) }
  let(:listing_id) { listing.id }

  subject { put api_v1_listing_path(listing_id), params: body, headers: auth_headers, as: :json }
  
  context 'when user is logged in' do

    let(:body) do
      {
        listing: {
          price_per_night: 26,
          top_amount_people: 12,
        }
      }
    end

    context 'when listing doest change' do
      
      it 'returns a successful status code' do
        subject
        expect(response).to have_http_status(:success)
      end
  
      it 'listing count doesnt change' do
        subject
        expect(Listing.count).to eq(1)
      end
  
      it 'returns the listing' do
        subject
  
        expect(json[:listing][:id]).to eq(listing.id)
        expect(json[:listing][:user][:first_name]).to eq(user.first_name)
        expect(json[:listing][:user][:last_name]).to eq(user.last_name)
        expect(json[:listing][:user][:email]).to eq(user.email)
      end
    end


    it 'changes the updated_at timestamp' do  
      byebug
      expect { subject }.to change { listing.reload.price_per_night }
    end
  end

  context 'when user is not logged in' do
    subject { put api_v1_listing_path(listing_id), as: :json }

    it 'returns unauthorized status code' do
      subject
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
