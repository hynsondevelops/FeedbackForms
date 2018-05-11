Rails.application.routes.draw do
  resources :student_levels do
    resources :random_sentences
  end
  resources :random_sentences
  resources :sentence_scores
  devise_for :users
  resources :mcm_topics
  get 'hello_world', to: 'hello_world#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
