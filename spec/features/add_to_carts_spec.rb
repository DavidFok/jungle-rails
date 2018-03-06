require 'rails_helper'

RSpec.feature "Visitor navigates to product detail page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  def add_product_to_cart
    first('article.product').find_link("Add").click
  end

  scenario "When user adds product to cart the item count in the navbar changes accordingly" do

    # ACT
    visit root_path
    add_product_to_cart

    # DEBUG
    sleep(1)
    save_screenshot

    #Verify
    expect(page).to have_content 'My Cart (1)'
  end
end