require "application_system_test_case"

class ManeysTest < ApplicationSystemTestCase
  setup do
    @maney = maneys(:one)
  end

  test "visiting the index" do
    visit maneys_url
    assert_selector "h1", text: "Maneys"
  end

  test "creating a Maney" do
    visit maneys_url
    click_on "New Maney"

    fill_in "Category", with: @maney.category_id
    fill_in "Content", with: @maney.content
    fill_in "Integer", with: @maney.integer
    fill_in "Price", with: @maney.price
    fill_in "User", with: @maney.user_id
    click_on "Create Maney"

    assert_text "Maney was successfully created"
    click_on "Back"
  end

  test "updating a Maney" do
    visit maneys_url
    click_on "Edit", match: :first

    fill_in "Category", with: @maney.category_id
    fill_in "Content", with: @maney.content
    fill_in "Integer", with: @maney.integer
    fill_in "Price", with: @maney.price
    fill_in "User", with: @maney.user_id
    click_on "Update Maney"

    assert_text "Maney was successfully updated"
    click_on "Back"
  end

  test "destroying a Maney" do
    visit maneys_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Maney was successfully destroyed"
  end
end
