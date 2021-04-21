require 'rails_helper'

RSpec.feature 'Task' do
  let!(:first_task) { FactoryBot.create(:first_task) }
  let!(:second_task) { FactoryBot.create(:second_task) }
  let!(:third_task) { FactoryBot.create(:third_task) }

  scenario 'sort desc by priority' do
    visit root_path
    find('.priority a.sort_link').click

    within(:xpath, '//table[2]/tr[1]') do
      expect(page).to have_content(I18n.t('high'))
    end

    within(:xpath, '//table[2]/tr[2]') do
      expect(page).to have_content(I18n.t('middle'))
    end

    within(:xpath, '//table[2]/tr[3]') do
      expect(page).to have_content(I18n.t('low'))
    end
  end
end
