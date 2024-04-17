require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    let(:valid_user) do
      User.new(
        first_name: "Test",
        last_name: "User",
        email: "test@example.org",
        password: "Password1!"
      )
    end

    it "is valid with valid attributes" do
      expect(valid_user).to be_valid
    end

    it "is invalid without an email" do
      invalid_user = valid_user.dup
      invalid_user.email = nil
      expect(invalid_user).not_to be_valid
      expect(invalid_user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a password" do
      invalid_user = valid_user.dup
      invalid_user.password = nil
      expect(invalid_user).not_to be_valid
      expect(invalid_user.errors[:password]).to include("can't be blank")
    end

    it "is invalid with a duplicate email" do
      valid_user.save!
      duplicate_user = valid_user.dup
      expect(duplicate_user).not_to be_valid
      expect(duplicate_user.errors[:email]).to include("has already been taken")
    end

    it "is invalid with a duplicate email (case insensitive)" do
      valid_user.save!
      duplicate_user = valid_user.dup
      duplicate_user.email = valid_user.email.upcase
      expect(duplicate_user).not_to be_valid
      expect(duplicate_user.errors[:email]).to include("has already been taken")
    end

    it "is invalid with a password without at least one letter" do
      invalid_user = valid_user.dup
      invalid_user.password = "12345678"
      expect(invalid_user).not_to be_valid
      expect(invalid_user.errors[:password]).to include("must contain at least one lowercase letter, one uppercase letter, one digit, one special character, and be at least 8 characters long")
    end

    it "is invalid with a password without at least one digit" do
      invalid_user = valid_user.dup
      invalid_user.password = "Password"
      expect(invalid_user).not_to be_valid
      expect(invalid_user.errors[:password]).to include("must contain at least one lowercase letter, one uppercase letter, one digit, one special character, and be at least 8 characters long")
    end

    it "is invalid with a password without at least one special character" do
      invalid_user = valid_user.dup
      invalid_user.password = "Password1"
      expect(invalid_user).not_to be_valid
      expect(invalid_user.errors[:password]).to include("must contain at least one lowercase letter, one uppercase letter, one digit, one special character, and be at least 8 characters long")
    end

    it "is invalid with a password without a uppercase letter" do
      invalid_user = valid_user.dup
      invalid_user.password = "password1!"
      expect(invalid_user).not_to be_valid
      expect(invalid_user.errors[:password]).to include("must contain at least one lowercase letter, one uppercase letter, one digit, one special character, and be at least 8 characters long")
    end

    it "is invalid with a password shorter than 8 characters" do
      invalid_user = valid_user.dup
      invalid_user.password = "Pass1!"
      expect(invalid_user).not_to be_valid
      expect(invalid_user.errors[:password]).to include("must contain at least one lowercase letter, one uppercase letter, one digit, one special character, and be at least 8 characters long")
    end

    it "is invalid without a first name" do
      invalid_user = valid_user.dup
      invalid_user.first_name = nil
      expect(invalid_user).not_to be_valid
      expect(invalid_user.errors[:first_name]).to include("can't be blank")
    end
  end
end