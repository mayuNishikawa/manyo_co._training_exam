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

  describe 'the function of search' do

    let!(:task) { FactoryBot.create(:task, name: 'task') }
    let!(:second_task) { FactoryBot.create(:second_task, name: "task 2") }
    let!(:third_task) { FactoryBot.create(:third_task, name: "sample")}

    context 'to execute ambiguous search by names with scope method' do
      it "is searched tasks which include search keyword" do
        expect(Task.search_by_name('task')).to include(task)
        expect(Task.search_by_name('task')).to include(second_task)
        expect(Task.search_by_name('task')).not_to include(third_task)
        expect(Task.search_by_name('task').count).to eq 2
      end
    end

    context 'to execute exact match search by status with scope method' do
      it "is searched tasks which match exactly" do
        expect(Task.search_by_status('not_yet')).to include(task)
        expect(Task.search_by_status('not_yet')).not_to include(second_task)
        expect(Task.search_by_status('not_yet')).not_to include(third_task)
        expect(Task.search_by_status('not_yet').count).to eq 1
      end
    end

    context 'to execute ambiguous search by names and exact match search by status with scope method' do
      it "is searched the tasks which include search keyword and the tasks which match exactly" do
        expect(Task.search_by_both('not_yet', 'task')).to include(task)
        expect(Task.search_by_both('not_yet', 'task')).not_to include(second_task)
        expect(Task.search_by_both('not_yet', 'task')).not_to include(third_task)
        expect(Task.search_by_both('not_yet', 'task').count).to eq 1
      end
    end
  end
end