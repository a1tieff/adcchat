require "application_system_test_case"

class CoversationsTest < ApplicationSystemTestCase
  setup do
    @coversation = coversations(:one)
  end

  test "visiting the index" do
    visit coversations_url
    assert_selector "h1", text: "Coversations"
  end

  test "creating a Coversation" do
    visit coversations_url
    click_on "New Coversation"

    fill_in "Description", with: @coversation.description
    fill_in "Title", with: @coversation.title
    click_on "Create Coversation"

    assert_text "Coversation was successfully created"
    click_on "Back"
  end

  test "updating a Coversation" do
    visit coversations_url
    click_on "Edit", match: :first

    fill_in "Description", with: @coversation.description
    fill_in "Title", with: @coversation.title
    click_on "Update Coversation"

    assert_text "Coversation was successfully updated"
    click_on "Back"
  end

  test "destroying a Coversation" do
    visit coversations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Coversation was successfully destroyed"
  end
end
