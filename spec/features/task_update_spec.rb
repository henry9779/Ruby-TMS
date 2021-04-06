require 'rails_helper'

RSpec.feature 'Update Task Flow' do
  let!(:first_task) { Task.create(title: 'hello', content: 'world') }
  scenario 'update task' do
    visit edit_task_path(first_task)

    fill_data('Ruby', 'Rails')
    click_button I18n.t('button.submit')

    expect(page).to have_content 'Ruby'
    expect(page).to have_content 'Rails'
    expect(Task.first.title).to eq 'Ruby'
    expect(Task.first.content).to eq 'Rails'
    expect(current_path).to eq root_path
    expect(page).to have_content I18n.t('task.updated')
  end
end
