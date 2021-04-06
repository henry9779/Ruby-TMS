require 'rails_helper'

RSpec.feature 'index' do
  let!(:first_task) { Task.create(title: 'first_task', content: 'first') }
  let!(:new_task) { Task.create(title: 'new_task', content: 'new') }
  scenario 'task desc' do
    visit root_path

    expect(page.body.index(new_task.title)).to be < page.body.index(first_task.title)
  end
end

private

  def fill_data(title, content)
    fill_in 'task_title', with: title
    fill_in 'task_content', with: content
  end
