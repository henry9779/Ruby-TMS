FactoryBot.define do
  factory :first_task, class: 'Task' do
    title { 'first task' }
    content { 'content' }
    priority { 'low' }
    end_at { '2050-12-25 12:25:00 +0800' }
    user
  end

  factory :second_task, class: 'Task' do
    title { 'second task' }
    content { 'content' }
    priority { 'middle' }
    end_at { '2050-12-25 12:25:00 +0800' }
    user { create(:second_user) }
  end

  factory :third_task, class: 'Task' do
    title { 'third task' }
    content { 'content' }
    priority { 'high' }
    end_at { '2050-12-25 12:25:00 +0800' }
    user { create(:third_user) }
  end
end
