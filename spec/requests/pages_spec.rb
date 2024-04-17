require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe "GET /" do
    context "when signed in" do
      let(:user) { create(:user) }
      before { sign_in(user) }
      it "returns http success" do
        get "/"
        expect(response).to have_http_status(:success)
        expect(response.body).to include("Test")
      end
    end

    context "when signed out" do
      it "redirects to sign in" do
        get "/"
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    # it "returns http success and includes user name even with a different user" do
    #   different_user = User.create(first_name: "Another", last_name: "User", email: "another@example.org", password: Devise::Encryptor.digest(User, "AnotherPassword1!"))
    #   sign_in(different_user)
    #   get "/"
    #   expect(response).to have_http_status(:success)
    #   expect(response.body).to include(different_user.first_name)
    # end
  end
  

end
