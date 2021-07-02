FactoryBot.define do
    factory :user do
      name { 'usertest01' }
      email { 'usertest01@gmail.com' }
      password { 'password' }
      admin { false }
    end
    factory :second_user, class: User do
      name { 'admintest01' }
      email { 'admintest01@gmail.com' }
      password { 'password' }
      admin { true }
    end

end
