require 'rails_helpers'

feature 'Task management' do
  scenario 'User creates a new task' do
    visit new_task_path

    fill_in 'Title', with: 'Hello'
    fill_in 'Content', with: 'World'
    click_button 'Create Task'

    expect(page).to have_css '.Task-title', '.Task-content', 'Create Task'

    visit root_path
    expect(page).to have_text 'Task Created'
  end

  scenario 'User updates a task' do
    click_button 'Edit'

    visit edit_task_path

    fill_in 'Title', with: 'Ruby'
    fill_in 'Content', with: 'Rails'
    click_button 'Update Task'

    expect(page).to have_css '.Task-title', '.Task-content', 'Update Task'

    visit root_path
    expect(page).to have_text 'Task Updated'
  end

  scenario 'User delete a task' do
    click_button 'Delete'

    expect(page).to have_notice 'Are you sure?'
    click_button '確定'

    visit root_path
    expect(page).to have_text 'Task Deleted'
  end
end

