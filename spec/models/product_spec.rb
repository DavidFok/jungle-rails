require 'rails_helper'

RSpec.describe Product, type: :model do

  before :example do
    @product = Product.new name: "Guitar", price_cents: 100000, quantity: 1, category_id: 1
  end


  it "creates a product record" do
    expect(@product.valid?).to eq true
  end


  describe 'Validation' do

    # validates :name, presence: true
    it 'should have throw an error without a name' do
      @product.name = nil
      expect(@product.valid?).to eq false #how come @product.save + raise_error doesn't work?!?!?!?!??!!
    end

    # validates :price_cents, presence: true
    it 'should have throw an error without a price' do
      @product.price_cents = nil
      expect(@product.valid?).to eq false
    end

    # validates :quantity, presence: true
    it 'should have throw an error without a quantity' do
      @product.quantity = nil
      expect(@product.valid?).to eq false
    end

    # validates :category_id, presence: true
    it 'should have throw an error without a category' do
      @product.category_id = nil
      expect(@product.valid?).to eq false
    end
  end
end