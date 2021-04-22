require 'rails_helper'

RSpec.feature 'Search Flow' do
  let!(:task) { Task.create(title: 'hello', content: 'world') }

  scenario 'search by title' do
    visit root_path

    fill_in 'q_title_cont', with: 'hello'
    click_button I18n.t('button.search')
    expect(page).to have_content 'hello'
  end

  scenario 'search by title no found' do
    visit root_path

    fill_in 'q_title_cont', with: '...'
    click_button I18n.t('button.search')
    expect(page).to have_content I18n.t('no_record')
  end

  scenario 'search by content' do
    visit root_path

    fill_in 'q_content_cont', with: 'world'
    click_button I18n.t('button.search')
    expect(page).to have_content 'world'
  end

  scenario 'search by content no found' do
    visit root_path

    fill_in 'q_content_cont', with: '...'
    click_button I18n.t('button.search')
    expect(page).to have_content I18n.t('no_record')
  end
end
