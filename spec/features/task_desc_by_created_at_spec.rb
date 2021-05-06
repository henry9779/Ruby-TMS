require 'rails_helper'

RSpec.feature 'Task' do
  let!(:first_task) { FactoryBot.create(:first_task) }
  let!(:second_task) { FactoryBot.create(:second_task) }

  scenario 'sort desc by created at' do
    visit root_path
    find('.created_at a').click

    expect(titles).to eq(['second task', 'first task'])
  end
end

private

def titles
  page.all('.title').map(&:text)
end
