require 'rails_helper'

# RSpec.describe Address, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe Address do
  describe "#step3" do
    it "is valid with postal_code, prefecture_id, city, house_number, user_id" do
      @user = FactoryBot.create(:user)
      @address = FactoryBot.create(:address)
      @address = @user.address
      @address.valid?
      expect(@address).to be_valid
    end

    it "is invalid without prefecture_id" do
      @address = build(:address, prefecture_id: "")
      @address.valid?
      expect(@address.errors[:prefecture_id]).to include("can't be blank")
    end   
    
    it "is invalid if selected does not match prefecture_id" do
      @address = build(:address, prefecture_id: '大阪府 ')
      @address.valid?
      expect(@address.errors[:prefecture_id]).to include("is not included in the list")
    end   

    it "is invalid without postal_code" do
      @address = build(:address, postal_code: "")
      @address.valid?
      expect(@address.errors[:postal_code]).to include("can't be blank")
    end   

    it "is invalid if postal_code is 6 or less figures" do
      @address = build(:address, postal_code: "123456")
      @address.valid?
      expect(@address.errors[:postal_code]).to include("is the wrong length (should be 7 characters)")
    end   

    it "is invalid if postal_code is 8 or more figures" do
      @address = build(:address, postal_code: "12345678")
      @address.valid?
      expect(@address.errors[:postal_code]).to include("is the wrong length (should be 7 characters)")
    end   

    it "is invalid if postal_code contains null character" do
      @address = build(:address, postal_code: " 111111")
      @address.valid?
      expect(@address.errors[:postal_code]).to include("is invalid")
    end   

    it "is invalid without city" do
      @address = build(:address, city: "")
      @address.valid?
      expect(@address.errors[:city]).to include("can't be blank")
    end   

    it "is invalid without house_number" do
      @address = build(:address, house_number: "")
      @address.valid?
      expect(@address.errors[:house_number]).to include("can't be blank")
    end   
    
    it "is invalid if phone_number is 10 or less figures" do
      @address = build(:address, phone_number: "0901234567")
      @address.valid?
      expect(@address.errors[:phone_number]).to include("is the wrong length (should be 11 characters)")
    end   

    it "is invalid if phone_number is 12 or more figures" do
      @address = build(:address, phone_number: "090123456789")
      @address.valid?
      expect(@address.errors[:phone_number]).to include("is the wrong length (should be 11 characters)")
    end   

    it "is invalid if phone_number contains null character" do
      @address = build(:address, phone_number: "0901234567 ")
      @address.valid?
      expect(@address.errors[:phone_number]).to include("is invalid")
    end   
    
  end
end    