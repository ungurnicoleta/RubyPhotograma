require "application_system_test_case"

class PhotoTagsTest < ApplicationSystemTestCase
  setup do
    @photo_tag = photo_tags(:one)
  end

  test "visiting the index" do
    visit photo_tags_url
    assert_selector "h1", text: "Photo Tags"
  end

  test "creating a Photo tag" do
    visit photo_tags_url
    click_on "New Photo Tag"

    fill_in "Photo", with: @photo_tag.photo_id
    fill_in "Tag", with: @photo_tag.tag_id
    click_on "Create Photo tag"

    assert_text "Photo tag was successfully created"
    click_on "Back"
  end

  test "updating a Photo tag" do
    visit photo_tags_url
    click_on "Edit", match: :first

    fill_in "Photo", with: @photo_tag.photo_id
    fill_in "Tag", with: @photo_tag.tag_id
    click_on "Update Photo tag"

    assert_text "Photo tag was successfully updated"
    click_on "Back"
  end

  test "destroying a Photo tag" do
    visit photo_tags_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Photo tag was successfully destroyed"
  end
end
