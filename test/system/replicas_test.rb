require "application_system_test_case"

class ReplicasTest < ApplicationSystemTestCase
  setup do
    @replica = replicas(:one)
  end

  test "visiting the index" do
    visit replicas_url
    assert_selector "h1", text: "Replicas"
  end

  test "creating a Replica" do
    visit replicas_url
    click_on "New Replica"

    fill_in "Position", with: @replica.position
    fill_in "Timeout", with: @replica.timeout
    fill_in "Type", with: @replica.type
    click_on "Create Replica"

    assert_text "Replica was successfully created"
    click_on "Back"
  end

  test "updating a Replica" do
    visit replicas_url
    click_on "Edit", match: :first

    fill_in "Position", with: @replica.position
    fill_in "Timeout", with: @replica.timeout
    fill_in "Type", with: @replica.type
    click_on "Update Replica"

    assert_text "Replica was successfully updated"
    click_on "Back"
  end

  test "destroying a Replica" do
    visit replicas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Replica was successfully destroyed"
  end
end
