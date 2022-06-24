FactoryBot.define do
  factory :task do
    name { 'default title 1' }
    content { 'default content 1' }
  end

  factory :second_task, class: Task do
    name { 'default title 2' }
    content { 'default content 2' }
  end
end