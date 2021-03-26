require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do 
    subject(:user) do
      FactoryBot.build(:user, username: 'Paul321', password: 'password', session_token: SecureRandom.base64(64) )
    end
  

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6)}

  it { should have_many(:goals) }
  
  it "generates a password_digest when a password is given" do
    expect(user.password_digest).to_not be_nil
  end

  it "creates a session_token" do
    user.valid?
    expect(user.session_token).to_not be_nil
  end
  #write a test for password=
  #write a test for self.find_by_credentials
  #write a test for reset_session_token

  describe "#reset_session_token!" do
    it "sets a new session token for the user" do
      user.valid?
      old_session_token = user.session_token
      user.reset_session_token!

      expect(user.session_token).to_not eq(old_session_token)
    end
    it "returns new session token" do
      expect(user.reset_session_token).to eq(user.session_token)
    end
  end

  describe "#is_password?" do
    it "checks for the correct password" do
      expect(user.is_password?('password')).to be true
    end
    it "checks for the incorrect password" do
      expect(user.is_password?('banana')).to be false
    end
  end

  describe "User::find_by_credentials" do
    before { user.save! }
    it "returns a user given correct credentials" do
      expect(User.find_by_credentials("Paul321", "password")).to eq(user)
    end
    it "returns nil given incorrect credentials" do
      expect(User.find_by_credentials("banana", "bananananan")).to eq(nil)
    end
  end

end
end
