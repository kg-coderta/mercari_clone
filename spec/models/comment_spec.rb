require 'rails_helper'

RSpec.describe Comment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "is invalid without a text" do
    item = build(:comment, text: "")
    item.valid?
    expect(item.errors[:text]).to include("can't be blank")
  end

  it "is invalid without a item_id" do
    item = build(:comment, item_id: nil)
    item.valid?
    expect(item.errors[:item_id]).to include("can't be blank")
  end

  it "is invalid without a name" do
    item = build(:comment, user_id: nil)
    item.valid?
    expect(item.errors[:user_id]).to include("can't be blank")
  end
end
