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

  def go_to_product_page
    visit root_path
    first('article.product').find_link("Details").click
  end

  scenario "They see the details of the product" do
    # ACT
    go_to_product_page

    # DEBUG
    sleep(1)
    save_screenshot

    #Verify
    expect(page).to have_css '.products-show'
  end

  scenario "When not signed in, they should have a button to login in the reviews section" do
    # ACT
    go_to_product_page
    # DEBUG
    sleep(1)
    save_screenshot

    #Verify
    click_link 'Login'
  end
end