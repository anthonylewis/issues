Issues::Application.routes.draw do
  devise_for :users

  resources :issues do
    resources :notes, :only => :create
  end

  root :to => "issues#index"
end
