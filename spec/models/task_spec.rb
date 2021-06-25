require 'rails_helper'

describe 'バリデーションのテスト' do

    before do
      # 「一覧画面に遷移した場合」や「タスクが作成日時の降順に並んでいる場合」など、contextが実行されるタイミングで、before内のコードが実行される
      visit tasks_path
    end
  describe '検索機能' do
    before do
      # 必要に応じて、テストデータの内容を変更して構わない
      FactoryBot.create(:task, name: "task")
      FactoryBot.create(:second_task, name:"test")
      FactoryBot.create(:third_task, name: "task3")
    end
    context 'タイトルであいまい検索をした場合' do
      it "検索キーワードを含むタスクで絞り込まれる" do
        visit tasks_path
        # タスクの検索欄に検索ワードを入力する (例: task)
        fill_in 'task_name', with: 'task'
        # 検索ボタンを押す
        click_on '検索' 
        expect(page).to have_content 'task'
      end
    end
    context 'ステータス検索をした場合' do
      it "ステータスに完全一致するタスクが絞り込まれる" do
        visit tasks_path
        # ここに実装する プルダウンを選択する「select」について調べてみること
        select "未着手", from: "task_status"
        click_on '検索'
        expect(page).to have_content '未着手'
      end
    end
    context 'タイトルのあいまい検索とステータス検索をした場合' do
      it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
        visit tasks_path
        # ここに実装する
        fill_in 'task_name', with: 'test'
        select "未着手", from: "task_status"
        click_on '検索'
        expect(page).to have_content 'test'
        expect(page).to have_content '未着手'
      end
    end
  end

  #context 'タスクのタイトルが空の場合' do
    #it 'バリデーションにひっかる' do
      #task = Task.new(title: '', content: '失敗テスト')
      #expect(task).not_to be_valid
    #end
  #end
　#context 'タスクの詳細が空の場合' do
    #it 'バリデーションにひっかかる' do
      #task = Task.new(title: '失敗テスト', content: '')
      #expect(task).not_to be_valid
    #end
  #end
  #context 'タスクのタイトルと詳細に内容が記載されている場合' do
    #it 'バリデーションが通る' do
      #task = Task.new(title: '成功テスト', content: '成功するよ')
      #expect(task).to be_valid
    #end
  #end

end
