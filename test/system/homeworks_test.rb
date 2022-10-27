require "application_system_test_case"

class HomeworksTest < ApplicationSystemTestCase
  setup do
    @homework = homeworks(:one)
  end

  test "visiting the index" do
    visit homeworks_url
    assert_selector "h1", text: "Homeworks"
  end

  test "should create homework" do
    visit homeworks_url
    click_on "New homework"

    fill_in "Category", with: @homework.category
    fill_in "Due date", with: @homework.due_date
    fill_in "Status", with: @homework.status
    fill_in "Subject", with: @homework.subject
    fill_in "Title", with: @homework.title
    click_on "Create Homework"

    assert_text "Homework was successfully created"
    click_on "Back"
  end

  test "should update Homework" do
    visit homework_url(@homework)
    click_on "Edit this homework", match: :first

    fill_in "Category", with: @homework.category
    fill_in "Due date", with: @homework.due_date
    fill_in "Status", with: @homework.status
    fill_in "Subject", with: @homework.subject
    fill_in "Title", with: @homework.title
    click_on "Update Homework"

    assert_text "Homework was successfully updated"
    click_on "Back"
  end

  test "should destroy Homework" do
    visit homework_url(@homework)
    click_on "Destroy this homework", match: :first

    assert_text "Homework was successfully destroyed"
  end
end
