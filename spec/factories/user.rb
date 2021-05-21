FactoryBot.define do
  factory :user, class: 'User' do
    name { 'Henry' }
    email { 'henry@5xruby.com' }
    password { '55555555' }
  end

  factory :second_user, class: 'User' do
    name { 'Henry' }
    email { 'henry@6xruby.com' }
    password { '55555555' }
  end

  factory :third_user, class: 'User' do
    name { 'Henry' }
    email { 'henry@7xruby.com' }
    password { '55555555' }
  end
end