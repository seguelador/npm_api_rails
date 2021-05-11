require "application_system_test_case"

class MaintainersTest < ApplicationSystemTestCase
  setup do
    @maintainer = maintainers(:one)
  end

  test "visiting the index" do
    visit maintainers_url
    assert_selector "h1", text: "Maintainers"
  end

  test "creating a Maintainer" do
    visit maintainers_url
    click_on "New Maintainer"

    fill_in "Name", with: @maintainer.name
    fill_in "References", with: @maintainer.references
    click_on "Create Maintainer"

    assert_text "Maintainer was successfully created"
    click_on "Back"
  end

  test "updating a Maintainer" do
    visit maintainers_url
    click_on "Edit", match: :first

    fill_in "Name", with: @maintainer.name
    fill_in "References", with: @maintainer.references
    click_on "Update Maintainer"

    assert_text "Maintainer was successfully updated"
    click_on "Back"
  end

  test "destroying a Maintainer" do
    visit maintainers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Maintainer was successfully destroyed"
  end
end
