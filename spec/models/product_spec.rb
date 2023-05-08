require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do



    # validate name
    it 'is not valid without a name' do
      @category = Category.new
      params = {
      description: 'The Giant Tea....',
      quantity: 0,
      category: @category,
      price_cents: 64.99
      }
      expect(Product.new(params)).to_not be_valid
    end
    
    it 'is valid with a name' do
      @category = Category.new
      params = {
      name: 'Giant Tea',
      description: 'The Giant Tea....',
      quantity: 0,
      category: @category,
      price_cents: 64.99
      }
      expect(Product.new(params)).to be_valid
    end




    #validate Price
    it "is not valid without a price" do
      @category = Category.new
      params = {
      name: 'Enirthelda',
      description: 'The Enirthelda is an uncommon, large plant and can be found only in some forests. It blooms once a year, for 2 months.
      It has narrow, barb shaped leaves, which are usually blue-green. It also grows huge flowers, which can be purple and light red.....',
      quantity: 8,
      category: @category
      }
      expect(Product.new(params)).to_not be_valid
    end
    
    it 'is valid with a Price' do
      @category = Category.new
      params = {
      name: 'Enirthelda',
      description: 'The Enirthelda is an uncommon, large plant and can be found only in some forests. It blooms once a year, for 2 months.
      It has narrow, barb shaped leaves, which are usually blue-green. It also grows huge flowers, which can be purple and light red.....',
      quantity: 8,
      category: @category,
      price_cents: 124.99
      }
      expect(Product.new(params)).to be_valid
    end





    # validate Quantity
    it "is not valid without a quantity" do
       @category = Category.new
      params = {
      name: 'Bone Coneflower',
      description: 'The Bone Coneflower is an uncommon, small plant and can be found only in some forests. It blooms in early spring.....',
      category: @category,
      price_cents: 24.99
      }
      expect(Product.new(params)).to_not be_valid
    end

    it "is valid with a quantity" do
       @category = Category.new
      params = {
      name: 'Bone Coneflower',
      description: 'The Bone Coneflower is an uncommon, small plant and can be found only in some forests. It blooms in early spring.....',
      quantity: 8,
      category: @category,
      price_cents: 24.99
      }
      expect(Product.new(params)).to be_valid
    end


    # validate Category
    it "is not valid without a category" do
      @category = Category.new
      params = {
      name:  'Lion Grapevine',
      description: "The Lion Grapevine is an uncommon, modest plant and can be found only in some humid regions. It blooms once a year, for 4 months.",
      quantity: 4,
      price: 34.49
      }
      expect(Product.new(params)).to_not be_valid
    end


    it "is valid with a category" do
      @category = Category.new
      params = {
      name:  'Lion Grapevine',
      description: "The Lion Grapevine is an uncommon, modest plant and can be found only in some humid regions. It blooms once a year, for 4 months.",
      quantity: 4,
      category: @category,
      price: 34.49
      }
      expect(Product.new(params)).to be_valid
    end

  end
end
