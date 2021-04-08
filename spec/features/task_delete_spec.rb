require 'rails_helper'

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
