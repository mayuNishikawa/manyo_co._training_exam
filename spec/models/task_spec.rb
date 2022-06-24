require 'rails_helper'
describe 'The function of task management', type: :model do

  describe 'validation test' do
    context 'task name is nill' do
      it 'is invalid' do
        task = Task.new(name: nil, content: '失敗テスト')
        expect(task).not_to be_valid
      end
    end

    context 'task content is nill' do
      it 'is invalid' do
        task = Task.new(name: '失敗テスト', content: '')
        expect(task).not_to be_valid
      end
    end

    context 'title and content is filled' do
      it 'is valid' do
        task = FactoryBot.create(:task, name: '成功テスト', content: '成功テスト')
        expect(task).to be_valid
      end
    end
  end
end