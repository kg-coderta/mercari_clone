require 'rails_helper'

RSpec.describe Photo, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  describe '#create' do
    it "is invalid without a image" do
      photo = Photo.new(image: "", item_id: 1)
      photo.valid?
      expect(photo.errors[:image]).to include("can't be blank")
    end

    it "is invalid without a item_id" do
      photo = Photo.new(image: "kkkkkkkkkkkkk", item_id: nil)
      photo.valid?
      expect(photo.errors[:item_id]).to include("can't be blank")
    end
  end
end
