require 'rails_helper'

RSpec.feature 'Task' do
  let!(:first_task) { FactoryBot.create(:first_task) }
  let!(:second_task) { FactoryBot.create(:second_task) }

  scenario 'sort desc by created at' do
    visit root_path
    find('.created_at a.sort_link').click

    within(:xpath, '//table[2]/tr[1]') do
      expect(page).to have_content('second task')
    end

    within(:xpath, '//table[2]/tr[2]') do
      expect(page).to have_content('first task')
    end
  end
end
