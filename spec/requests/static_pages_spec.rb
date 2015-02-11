require 'rails_helper'

describe "Static pages" do
  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('Welcome') }
    it { should have_title('Fumblr') }
    it { should_not have_title('| Home') }

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        visit new_user_session_path
        fill_in "Email",    with: user.email
        fill_in "Password", with: user.password
        click_button "Sign in"

        visit root_path
      end  

      it "should acknowledge the signed-in user" do
        
        expect(page).to have_content(user.email)
        
      end  
    end
  end
end