require "application_system_test_case"

class ToystoresTest < ApplicationSystemTestCase
  setup do
    @toystore = toystores(:one)
  end

  test "visiting the index" do
    visit toystores_url
    assert_selector "h1", text: "Toystores"
  end

  test "should create toystore" do
    visit toystores_url
    click_on "New toystore"

    fill_in "Brand", with: @toystore.brand
    fill_in "Description", with: @toystore.description
    fill_in "Name", with: @toystore.name
    fill_in "Price", with: @toystore.price
    fill_in "Toytype", with: @toystore.toytype
    click_on "Create Toystore"

    assert_text "Toystore was successfully created"
    click_on "Back"
  end

  test "should update Toystore" do
    visit toystore_url(@toystore)
    click_on "Edit this toystore", match: :first

    fill_in "Brand", with: @toystore.brand
    fill_in "Description", with: @toystore.description
    fill_in "Name", with: @toystore.name
    fill_in "Price", with: @toystore.price
    fill_in "Toytype", with: @toystore.toytype
    click_on "Update Toystore"

    assert_text "Toystore was successfully updated"
    click_on "Back"
  end

  test "should destroy Toystore" do
    visit toystore_url(@toystore)
    click_on "Destroy this toystore", match: :first

    assert_text "Toystore was successfully destroyed"
  end
end
