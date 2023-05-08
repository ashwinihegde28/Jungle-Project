require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    # validation examples here
    # valid case
    it 'is valid with valid attributes' do        
        params = {
        name:'aaa',
        email: 'aa@com',
        password:'12345',
        password_confirmation:'12345'
        }
        expect(User.new(params)).to be_valid

    end

    # Password validation
    it 'should not be valid if password is less than 5 characters' do
        params = {
        name:'aaa',
        email: 'aaa@com',
        password:'12',
        password_confirmation:'12'
        }
        expect(User.new(params)).to_not be_valid
      end


      # Password and confirm password validation
       it 'should not be valid if password and pass confirmation do not match' do
        params = {
        name:'aaa',
        email: 'aaa@com',
        password:'12345',
        password_confirmation:'1234'
        }
        expect(User.new(params)).to_not be_valid
      end

    #Validate : Email, first name, and last name should also be required
    it 'should not be valid without email, first name, and last name' do
        params = {
        name:nil,
        email: nil,
        password:'12345',
        password_confirmation:'12345'
        }
        expect(User.new(params)).to_not be_valid
      end

    # Emails must be unique (not case sensitive)
    it "should not be valid if email already exists in db" do
        params1 = {
        name:'aaa',
        email: 'aaa@com',
        password:'12345',
        password_confirmation:'12345'
        }

        params2 = {
        name:'aaa',
        email: 'aaa@com',
        password:'12345',
        password_confirmation:'12345'
        }
        @user1 = User.create(params1)
        @user2 = User.new(params2)
        expect(@user2).not_to be_valid
    end

  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it "checks the login and returns the authenticated user" do
        user = User.create(name: "aaa", :email => "ab@com", :password => "ABCDEf", :password_confirmation => "ABCDEf")
        authenticated_user = User.authenticate_with_credentials("ab@com", "ABCDEf")
        expect(authenticated_user).to eq(user)
    end

    it "checks the login and returns nill if the login does not validate" do
        user = User.create(name: "abc", :email => "ab@com", :password => "Abcdef", :password_confirmation => "Abcdef")
        authenticated_user = User.authenticate_with_credentials("ba@com", "Abcdef")
        expect(authenticated_user).to eq(nil)
    end

    it "checks the login and returns authenticated user regardless of trailing spaces or capitaliztion" do
          user = User.create(name: "111", :email => "111@com", :password => "Abcdef", :password_confirmation => "Abcdef")
          authenticated_user = User.authenticate_with_credentials("111@com ", "Abcdef")
          expect(authenticated_user).to eq(user)
    end

  end

end
