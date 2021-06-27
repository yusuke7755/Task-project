require 'rails_helper'

describe 'タスクモデル機能', type: :model do

  #step1 step2 step3
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
        task = Task.new(title: '成功テスト', content: '成功', deadline: '2021/06/25', status: 'completed', priority: 'high' )
        expect(task).to be_valid
      end
    end
  end

  #Step3
  describe '検索機能' do
    let!(:task) { FactoryBot.create(:task, title: 'task1', status: 'not_yet', priority: 'high' ) }
    let!(:second_task) { FactoryBot.create(:second_task, title: 'test2', status: 'in_progress', priority: 'middle' ) }
    let!(:third_task) { FactoryBot.create(:second_task, title: 'sample3', status: 'completed', priority: 'low' ) }

    context 'scopeメソッドでタイトルのあいまい検索をした場合' do
      it "検索キーワードを含むタスクが絞り込まれる" do
        expect(Task.title_search('task')).to include(task)
        expect(Task.title_search('task')).not_to include(second_task)
        expect(Task.title_search('task').count).to eq 1
      end
    end
    context 'scopeメソッドでステータス検索をした場合' do
      it "ステータスに完全一致するタスクが絞り込まれる" do
        expect(Task.status_search('not_yet')).to include(task)
        expect(Task.status_search('not_yet')).not_to include(second_task)
        expect(Task.status_search('not_yet').count).to eq 1
      end
    end
    context 'scopeメソッドでタイトルのあいまい検索とステータス検索をした場合' do
      it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
        expect(Task.title_search('task')).to include(task)
        expect(Task.status_search('not_yet')).to include(task)
        expect(Task.title_search('task').count).to eq 1
        expect(Task.status_search('not_yet').count).to eq 1
      end
    end
  end

end

