require 'rails_helper'

describe User do
  describe '#create' do
    it "is valid with a nickname, email, password, password_confirmation" do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end

    it "is valid without a nickname" do
      user = FactoryBot.build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid without a email" do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invaid without a password" do
      user = FactoryBot.build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid without a password_confirmation" do
      user = FactoryBot.build(:user, password_confirmation: nil)
      user.valid?
      expect(user.errors[:password_confirmation]).to include("can't be blank")
    end

    it "is invalid with a duplicate email address" do
      user = FactoryBot.create(:user)
      another_user = FactoryBot.build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "is valid with a password that has more than 7 characters" do
      user = FactoryBot.build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user).to be_valid
    end

    it "is valid with a password that has less than 6 characters" do
      user = FactoryBot.build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end

    it "is valid with a nickname that has more than 20 characters" do
      user = FactoryBot.build(:user, nickname: "00000000000000000000")
      user.valid?
      expect(user).to be_valid
    end

    it "is valid with a nickname that has less than 19 characters" do
      user = FactoryBot.build(:user, nickname: "0000000000000000000")
      user.valid?
      expect(user).to be_valid
    end
  end
end
