require 'rails_helper'

RSpec.feature 'Create Task Flow' do
  scenario 'create task' do
    visit new_task_path

    fill_data('Ruby', 'Rails')
    click_button I18n.t('button.submit')

    expect(page).to have_content 'Ruby'
    expect(page).to have_content 'Rails'
    expect(Task.count).to eq 1
    expect(current_path).to eq root_path
    expect(page).to have_content I18n.t('task.created')
  end
end

RSpec.feature 'Update Task Flow' do
  let!(:first_task) { Task.create(title: 'hello', content: 'world') }
  scenario 'update task' do
    visit edit_task_path(first_task)

    fill_data('Ruby', 'Rails')
    click_button I18n.t('button.submit')

    expect(page).to have_content 'Ruby'
    expect(page).to have_content 'Rails'
    expect(current_path).to eq root_path
    expect(page).to have_content I18n.t('task.updated')
  end
end

RSpec.feature 'Delete Task Flow' do
  let!(:first_task) { Task.create(title: 'hello', content: 'world') }
  scenario 'delete task' do
    visit root_path
    click_link I18n.t('task.delete')

    expect(Task.count).to eq 0
    expect(current_path).to eq root_path
    expect(page).to have_content I18n.t('task.deleted')
  end
end

RSpec.feature 'index' do
  let!(:first_task) { Task.create(title: 'first_task', content: 'first') }
  let!(:new_task) { Task.create(title: 'new_task', content: 'new') }
  scenario 'task desc' do
    visit root_path

    expect(page.body.index(new_task.title)).to be < page.body.index(first_task.title)
  end
end

private

  def fill_data(title, content)
    fill_in 'task_title', with: title
    fill_in 'task_content', with: content
  end
