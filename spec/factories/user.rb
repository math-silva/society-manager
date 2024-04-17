FactoryBot.define do
  factory :user do
    first_name { 'John Doe' }
    last_name { 'User' }
    email { 'test@example.org' }
    password { 'Password1!' }
  end
end