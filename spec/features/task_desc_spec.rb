require 'rails_helper'

RSpec.feature 'Index' do
  let!(:first_task) { Task.create(title: 'first task', content: 'first') }
  let!(:second_task) { Task.create(title: 'second task', content: 'second') }

  scenario 'task sort by create time' do
    visit root_path

    within(:xpath, '/html/body/table[2]/tr[1]') do
      expect(page).to have_content('second task')
    end

    within(:xpath, '/html/body/table[2]/tr[2]') do
      expect(page).to have_content('first task')
    end
  end
end
