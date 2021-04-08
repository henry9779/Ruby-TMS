require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'not_validates' do
    expect(Task.new).not_to be_valid
  end
end

RSpec.describe Task, type: :model do
  it 'validates' do
    expect(Task.new(title: 'title', content: 'content')).to be_valid
  end
end
