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
      let!(:another_user) { FactoryGirl.create(:user) }
      let!(:p1) { FactoryGirl.create(:post, user: user, content: "Foo") }
      let!(:p2) { FactoryGirl.create(:post, user: another_user, content: "Bar") }

      before do
        visit new_user_session_path
        fill_in "Email",    with: user.email
        fill_in "Password", with: user.password
        click_button "Sign in"

        visit user_path(another_user)

        click_link "Follow"

        visit root_path        
      end  

      it "should acknowledge the signed-in user" do
        
        expect(page).to have_content(user.email)
        
      end  

      it "should show the signed-in user's posts" do
        expect(page).to have_content(p1.content)
      end

      it "should show the signed-in user's followed users' posts" do
        expect(page).to have_content(p2.content)
      end
    end
  end
end