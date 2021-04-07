require 'rails_helper'

RSpec.feature 'Create Task Flow' do
  scenario 'create task' do
    visit new_task_path

    fill_data('Ruby', 'Rails', '2050-12-25 12:25:00 +0800')
    click_button I18n.t('button.submit')

    expect(page).to have_content 'Ruby'
    expect(page).to have_content 'Rails'
    expect(page).to have_content '2050-12-25 12:25:00 +0800'
    expect(Task.count).to eq 1
    expect(Task.first.title).to eq 'Ruby'
    expect(Task.first.content).to eq 'Rails'
    expect(Task.first.end_at).to eq '2050-12-25 12:25:00 +0800'
    expect(current_path).to eq root_path
    expect(page).to have_content I18n.t('task.created')
  end
end

private

  def fill_data(title, content, end_at)
    fill_in 'task_title', with: title
    fill_in 'task_content', with: content
    fill_in 'task_end_at', with: end_at
  end
