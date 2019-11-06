require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "is invalid without a name" do
    item = build(:item, name: "")
    item.valid?
    expect(item.errors[:name]).to include("can't be blank")
  end

  it "is invalid without a description" do
    item = build(:item, description: "")
    item.valid?
    expect(item.errors[:descriptionname]).to include("can't be blank")
  end

  it "is invalid without a state" do
    item = build(:item, state: "")
    item.valid?
    expect(item.errors[:state]).to include("can't be blank")
  end

  it "is invalid without a method" do
    item = build(:item, method: "")
    item.valid?
    expect(item.errors[:method]).to include("can't be blank")
  end

  it "is invalid without a carriage" do
    item = build(:item, carriage: "")
    item.valid?
    expect(item.errors[:carriage]).to include("can't be blank")
  end

  it "is invalid without a region" do
    item = build(:item, region: "")
    item.valid?
    expect(item.errors[:region]).to include("can't be blank")
  end

  it "is invalid without a date" do
    item = build(:item, date: "")
    item.valid?
    expect(item.errors[:date]).to include("can't be blank")
  end

  it "is invalid without a price" do
    item = build(:item, price: "")
    item.valid?
    expect(item.errors[:price]).to include("can't be blank")
  end

end
