require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    let(:user) { create(:user) }

    it "is valid with valid attributes" do
      expect(user).to be_valid
    end

    it "is invalid without a first name" do
      user.first_name = nil
      expect(user).not_to be_valid
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "is invalid without a last name" do
      user.last_name = nil
      expect(user).not_to be_valid
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it "is invalid without an email" do
      user.email = nil
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid with a duplicate email" do
      user.save!
      duplicate_user = user.dup
      expect(duplicate_user).not_to be_valid
      expect(duplicate_user.errors[:email]).to include("has already been taken")
    end

    it "is invalid with a duplicate email (case insensitive)" do
      user.save!
      duplicate_user = user.dup
      duplicate_user.email = user.email.upcase
      expect(duplicate_user).not_to be_valid
      expect(duplicate_user.errors[:email]).to include("has already been taken")
    end

    it "is invalid with a password without at least one letter" do
      user.password = "12345678"
      expect(user).not_to be_valid
      expect(user.errors[:password]).to include("must contain at least one lowercase letter, one uppercase letter, one digit, one special character, and be at least 8 characters long")
    end

    it "is invalid with a password without at least one digit" do
      user.password = "Password"
      expect(user).not_to be_valid
      expect(user.errors[:password]).to include("must contain at least one lowercase letter, one uppercase letter, one digit, one special character, and be at least 8 characters long")
    end

    it "is invalid with a password without at least one special character" do
      user.password = "Password1"
      expect(user).not_to be_valid
      expect(user.errors[:password]).to include("must contain at least one lowercase letter, one uppercase letter, one digit, one special character, and be at least 8 characters long")
    end

    it "is invalid with a password without a uppercase letter" do
      user.password = "password1!"
      expect(user).not_to be_valid
      expect(user.errors[:password]).to include("must contain at least one lowercase letter, one uppercase letter, one digit, one special character, and be at least 8 characters long")
    end

    it "is invalid with a password shorter than 8 characters" do
      user.password = "Pass1!"
      expect(user).not_to be_valid
      expect(user.errors[:password]).to include("must contain at least one lowercase letter, one uppercase letter, one digit, one special character, and be at least 8 characters long")
    end

    it "is valid with a password containing multiple special characters" do
      user.password = "Password1!@#$%"
      expect(user).to be_valid
    end
  end
end