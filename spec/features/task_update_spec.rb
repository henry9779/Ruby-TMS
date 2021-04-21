require 'rails_helper'

RSpec.feature 'Update Task Flow' do
  let!(:first_task) { FactoryBot.create(:first_task) }

  scenario 'update task' do
    visit edit_task_path(first_task)

    fill_data('ruby', 'rails', '2050-12-25 12:25:00 +0800')
    click_button I18n.t('button.submit')

    expect(page).to have_content 'ruby'
    expect(page).to have_content 'rails'
    expect(page).to have_content '2050-12-25 12:25:00 +0800'
    expect_task_data_eql(Task.first,
                         title: 'ruby',
                         content: 'rails',
                         end_at: '2050-12-25 12:25:00 +0800')
    expect(current_path).to eq root_path
    expect(page).to have_content I18n.t('task.updated')
  end
end
