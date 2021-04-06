require 'rails_helper'

RSpec.feature 'Create Task Flow' do
  scenario 'create task' do
    visit new_task_path

    fill_data('Ruby', 'Rails')
    click_button I18n.t('button.submit')

    expect(page).to have_content 'Ruby'
    expect(page).to have_content 'Rails'
    expect(Task.count).to eq 1
    expect(Task.first.title).to eq 'Ruby'
    expect(Task.first.content).to eq 'Rails'
    expect(current_path).to eq root_path
    expect(page).to have_content I18n.t('task.created')
  end
end
