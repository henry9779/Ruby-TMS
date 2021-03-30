require 'rails_helper'

RSpec.feature 'Task management', :type => :feature do

  # 先新增一個任務，給編輯跟刪除使用
  let!(:first_task) { Task.create(title: 'hello', content: 'world') }

  scenario 'User creates a new task' do
    visit new_task_path

    fill_in 'task_title', with: 'Ruby'
    fill_in 'task_content', with: 'Rails'
    click_button 'Create Task'

    expect(page).to have_content /Ruby.*?Rails/
    expect(Task.count).to eq 2
    expect(current_path).to eq root_path
  end

  scenario 'User updates a task' do
    visit edit_task_path(first_task)

    fill_in 'task_title', with: 'Ruby'
    fill_in 'task_content', with: 'Rails'
    click_button 'Update Task'

    expect(page).to have_content /Ruby.*?Rails/
    expect(current_path).to eq root_path
  end

  scenario 'User delete a task' do
    visit root_path
    click_link 'Delete'

    expect(Task.count).to eq 0
    expect(current_path).to eq root_path
  end
end

