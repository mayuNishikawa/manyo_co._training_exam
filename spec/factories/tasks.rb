FactoryBot.define do
  factory :task, class: Task do
    name { 'default title 1' }
    content { 'default content 1' }
    deadline { "2022/07/02 18:00" }
    status { 'not_yet' }
    priority { 'low' }
  end

  factory :second_task, class: Task do
    name { 'default title 2' }
    content { 'default content 2' }
    deadline { "2022/07/01 18:00" }
    status { 'doing' }
    priority { 'medium' }
  end

  factory :third_task, class: Task do
    name { 'default title 3' }
    content { 'default content 2' }
    deadline { "2022/07/03 18:00" }
    status { 'done' }
    priority { 'high' }
  end
end