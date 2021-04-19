require 'rails_helper'

RSpec.feature 'Index' do
  let!(:first_task) { Task.create(title: 'first_task', content: 'first') }
  let!(:new_task) { Task.create(title: 'new_task', content: 'new') }

  scenario 'task desc' do
    visit root_path

    expect(page.body.index(new_task.title)).to be < page.body.index(first_task.title)
  end
end
