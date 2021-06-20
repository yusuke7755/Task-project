require 'rails_helper'

#before do
  #FactoryBot.create(:task)
  #FactoryBot.create(:second_task)
#end

describe 'バリデーションのテスト' do

  context 'タスクのタイトルが空の場合' do
    it 'バリデーションにひっかる' do
      task = Task.new(title: '', content: '失敗テスト')
      expect(task).not_to be_valid
    end
  end

　context 'タスクの詳細が空の場合' do
    it 'バリデーションにひっかかる' do
      task = Task.new(title: '失敗テスト', content: '')
      expect(task).not_to be_valid
    end
  end

  context 'タスクのタイトルと詳細に内容が記載されている場合' do
    it 'バリデーションが通る' do
      task = Task.new(title: '成功テスト', content: '成功するよ')
      expect(task).to be_valid
    end
  end
  
end

