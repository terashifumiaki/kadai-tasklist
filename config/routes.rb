Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  root to: 'tasks#index'
  
  # 省略形で書きますよ基本の７ルーティング↓
  resources :tasks
# ７つを、RESTfulなルーティングというらしい。

# 既に resources で users#new は設定されているのに、 
# get 'signup', to: 'users#new' をわざわざルーティングに追加したのは、
# ユーザの新規登録 URL を /signup にしたかったからです。 
# resources :users で生成される URL である /users/new は少し格好悪く思えます。
# そんなときには get 'signup' のように個別に設定することで解決します。
# また、 resources に :new も追加しているので /users/new でも新規登録ページが表示されます。
# それが嫌な場合には only 内の :new は削除します。
  get 'signup', to: 'users#new'
  
# 新規ユーザ登録のみ実装↓
  resources :users, only: [:new, :create]

end
