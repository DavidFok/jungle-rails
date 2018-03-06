require 'rails_helper'

RSpec.describe User, type: :model do

  before :example do
    @user = User.new first_name: "Joel", last_name: "Joel", email: "joel@joel.joel", password: "asdf", password_confirmation: "asdf"
  end


  it "creates a product record" do
    expect(@user.valid?).to eq true
  end

  it "saves a product record" do
    expect {@user.save!}.not_to raise_error
  end



  describe 'Validation' do

    # validates :first_name, presence: true
    it 'should have throw an error without a first_name' do
      @user.first_name = nil
      expect(@user.valid?).to eq false
    end

    # validates :last_name, presence: true
    it 'should have throw an error without a last_name' do
      @user.last_name = nil
      expect(@user.valid?).to eq false
    end

    # validates :email, presence: true
    it 'should have throw an error without an email' do
      @user.email = nil
      expect(@user.valid?).to eq false
    end

    # validates :password, presence: true
    it 'should have throw an error without a password' do
      @user.password = nil
      expect(@user.valid?).to eq false
    end

    # validates :password_confirmation, presence: true
    it 'should have throw an error without a password_confirmation' do
      @user.password_confirmation = nil
      expect(@user.valid?).to eq false
    end
  end




  describe 'passwords' do
    # validates :password, confirmation: true
    it 'should throw an error if the password and password_confirmation dont match' do
      @user.password_confirmation = "adsf"
      expect {@user.save!}.to raise_error ActiveRecord::RecordInvalid, "Validation failed: Password confirmation doesn't match Password, Password confirmation doesn't match Password"
    end

    # validates :password, length: { minimum: 4 }
    it 'should throw an error if the password is too short' do
      @user.password = "asd"
      @user.password_confirmation ="asd"
      expect {@user.save!}.to raise_error ActiveRecord::RecordInvalid, "Validation failed: Password is too short (minimum is 4 characters)"
    end
  end



  describe "emails must be unique" do
    # validates :email, uniqueness: { case_sensitive: false }
    it 'should throw an error if a user with the matching email is already in the database' do
      @user1 = User.create first_name: "Joel", last_name: "Joel", email: "joel@joel.joel", password: "asdf", password_confirmation: "asdf"
      expect {@user.save!}.to raise_error ActiveRecord::RecordInvalid, "Validation failed: Email has already been taken"
    end

    # validates :email, uniqueness: #####{ case_sensitive: false }#####
    it 'should throw an error if a user enters an email that matches but is not in the same case' do
      @user1 = User.create first_name: "Joel", last_name: "Joel", email: "joel@joel.joel", password: "asdf", password_confirmation: "asdf"
      @user.email = "JOEL@joel.joel"
      expect {@user.save!}.to raise_error ActiveRecord::RecordInvalid, "Validation failed: Email has already been taken"
    end
  end
end