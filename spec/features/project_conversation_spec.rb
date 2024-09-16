require 'rails_helper'

RSpec.feature "Project Conversations", type: :feature do
  let(:user) { create(:user) }
  let!(:project) { create(:project) }

  before do
    login_as(user, scope: :user)
  end

  scenario "User views list of projects" do
    visit projects_path
    expect(page).to have_content(project.name)
  end

  scenario "User creates a new project" do
    visit new_project_path
    fill_in "Name", with: "New Test Project"
    select "Not Started", from: "Status"
    click_button "Create Project"
    expect(page).to have_content("Project was successfully created")
    expect(page).to have_content("New Test Project")
  end

  scenario "User views a project and its conversation history" do
    comment = create(:comment, project: project, user: user)
    status_change = create(:status_change, project: project, user: user)

    visit project_path(project)
    expect(page).to have_content(project.name)
    expect(page).to have_content(comment.content)
    expect(page).to have_content("Status changed to #{status_change.new_status}")
  end

  scenario "User adds a comment to a project" do
    visit project_path(project)
    fill_in "Add a comment", with: "This is a new comment"
    click_button "Post Comment"
    expect(page).to have_content("Comment was successfully added")
    expect(page).to have_content("This is a new comment")
  end

  scenario "User changes project status" do
    visit project_path(project)
    select "In Progress", from: "New status"
    click_button "Update Status"
    expect(page).to have_content("Project status was successfully updated")
    expect(page).to have_content("Status changed to In Progress")
  end

  scenario "Conversation items are paginated" do
    21.times do |i|
      create(:comment, project: project, user: user, content: "Comment #{i}")
    end

    visit project_path(project)
    expect(page).to have_content("Comment 20")
    expect(page).not_to have_content("Comment 0")

    click_link "Next"
    expect(page).to have_content("Comment 0")
    expect(page).not_to have_content("Comment 20")
  end
end
