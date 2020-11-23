Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # トップページ"/"と"/tasks"にアクセスしたときのルーティング
  root to: 'tasks#index'
  # 省略形で書きますよ基本の７ルーティング↓
  resources :tasks
# ７つを、RESTfulなルーティングというらしい。
end

# GitHubへのプッシュのためテストで変更コメントしてます。