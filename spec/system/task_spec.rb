require 'rails_helper'
RSpec.describe 'The function of task management', type: :system do

  before do
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
  end

  describe 'the function of to create task' do
    context 'creating task' do
      it 'is shown at index' do
        task = FactoryBot.create(:task, name: 'task')
        visit tasks_path
        expect(page).to have_content 'task'
      end
    end
  end
  describe 'to display index.html' do
    context 'visiting index page' do
      it 'is shown all created tasks' do
        visit tasks_path
        expect(page).to have_content 'title 1'
        expect(page).to have_content 'title 2'
      end
    end
  end
  describe 'to display show.html' do
    context 'visiting one page' do
      it 'is shown that page' do
        task = FactoryBot.create(:second_task, name: 'aaaaa')
        visit task_path(task)
        expect(page).to have_content 'aaaaa'
      end
    end
  end
end