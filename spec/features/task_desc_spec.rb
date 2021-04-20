require 'rails_helper'

RSpec.feature 'Task' do
  let!(:first_task) { Task.create(title: 'first task', content: 'content') }
  let!(:second_task) { Task.create(title: 'second task', content: 'content') }

  scenario 'sort desc by create at' do
    visit root_path
    find('a[href="/?q%5Bs%5D=created_at+desc"]').click

    within(:xpath, '//table[2]/tr[1]') do
      expect(page).to have_content('second task')
    end

    within(:xpath, '//table[2]/tr[2]') do
      expect(page).to have_content('first task')
    end
  end
end
