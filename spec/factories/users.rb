FactoryBot.define do
  factory :admin_user, class: User do
    name { "admin_user" }
    email { "admin_user@example.com" }
    password { "adminadmin" }
    admin { true }
  end

  factory :user do
    name { "user" }
    email { "user@example.com" }
    password { "useruser" }
    admin { false }
  end

  factory :second_user, class: User do
    name { "second_user" }
    email { "second_user@example.com" }
    password { "useruser" }
    admin { false }
  end
end
