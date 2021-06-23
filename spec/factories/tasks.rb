# 「FactoryBotを使用します」という記述
FactoryBot.define do

  # 作成するテストデータの名前を「task」とします
  #factory :task do
    #title { 'タイトル１' }
    #content { 'コンテント１' }
  #end
  # 作成するテストデータの名前を「second_task」とします
  #factory :second_task, class: Task do
    #title { 'タイトル２' }
    #content { 'コンテント２' }
  #end

      # 作成するテストデータの名前を「task」とします
    factory :task do
      name { 'タイトル１' }
      detail { 'コンテント１' }
      deadline { DateTime.now }
      status {'completed'}
      priority {'high'}
    end
    # 作成するテストデータの名前を「second_task」とします
    factory :second_task, class: Task do
      name { 'タイトル２' }
      detail { 'コンテント２' }
      deadline { DateTime.tomorrow }
      status {'not_yet'}
      priority {'middle'}
    end

    factory :third_task, class: Task do
      name { 'タイトル3' }
      detail { 'コンテント3' }
      deadline { DateTime.now.since(5.days) }
      status {'in_progress'}
      priority {'low'}
    end  

end
