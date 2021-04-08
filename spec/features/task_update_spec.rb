require 'rails_helper'

RSpec.feature 'Update Task Flow' do
  let!(:first_task) { Task.create(title: 'hello', content: 'world') }

  scenario 'update task' do
    visit edit_task_path(first_task)

    fill_data('Ruby', 'Rails', '2050-12-25 12:25:00 +0800')
    click_button I18n.t('button.submit')

    expect(page).to have_content 'Ruby'
    expect(page).to have_content 'Rails'
    expect(page).to have_content '2050-12-25 12:25:00 +0800'
    expect_task_data_eql(Task.first,
                        title: 'Ruby',
                        content: 'Rails',
                        end_at: '2050-12-25 12:25:00 +0800')
    expect(current_path).to eq root_path
    expect(page).to have_content I18n.t('task.updated')
  end
end
