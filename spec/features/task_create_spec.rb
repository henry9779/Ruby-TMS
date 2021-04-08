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
    expect_task_data_eql(Task.first,
                        title: 'Ruby',
                        content: 'Rails',
                        end_at: '2050-12-25 12:25:00 +0800')
    expect(current_path).to eq root_path
    expect(page).to have_content I18n.t('task.created')
  end
end
