require 'rails_helper'

RSpec.feature 'Task' do
  let!(:first_task) { FactoryBot.create(:first_task) }
  let!(:second_task) { FactoryBot.create(:second_task) }
  let!(:third_task) { FactoryBot.create(:third_task) }
  scenario 'sort desc by priority' do
    visit root_path
    find('.priority a').click

    expect(priorities).to eq([I18n.t('high'),
                                        I18n.t('middle'),
                                        I18n.t('low')])
  end
end

private

  def priorities
    page.all('.task-priority').map(&:text)
  end
