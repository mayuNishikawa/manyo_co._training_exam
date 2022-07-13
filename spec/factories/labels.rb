FactoryBot.define do
  factory :label, class: Label do
    name { 'label 1' }
  end

  factory :second_label, class: Label do
    name { 'label 2' }
  end

  factory :third_label, class: Label do
    name { 'label 3' }
  end
end
