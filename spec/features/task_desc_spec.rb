require 'rails_helper'

RSpec.feature 'Task' do
  let!(:first_task) { Task.create(title: 'first task', content: 'content') }
  let!(:second_task) { Task.create(title: 'second task', content: 'content') }

  scenario 'sort desc by create at' do
    visit root_path
    find('.created_at a').click

    expect(titles).to eq(['second task', 'first task'])
  end
end

private

def titles
  page.all('.title').map(&:text)
end
