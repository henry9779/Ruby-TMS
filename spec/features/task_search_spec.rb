require 'rails_helper'

RSpec.feature 'Search Flow' do
  let!(:first_task) { FactoryBot.create(:first_task) }

  scenario 'search by title' do
    visit root_path

    fill_in 'q_title_cont', with: 'first'
    click_button I18n.t('button.search')
    expect(page).to have_content 'first task'
  end

  scenario 'search by title no found' do
    visit root_path

    fill_in 'q_title_cont', with: '...'
    click_button I18n.t('button.search')
    expect(page).to have_content I18n.t('no_record')
  end

  scenario 'search by content' do
    visit root_path

    fill_in 'q_content_cont', with: 'con'
    click_button I18n.t('button.search')
    expect(page).to have_content 'content'
  end

  scenario 'search by content no found' do
    visit root_path

    fill_in 'q_content_cont', with: '...'
    click_button I18n.t('button.search')
    expect(page).to have_content I18n.t('no_record')
  end
end
