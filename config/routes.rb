Rails.application.routes.draw do
  resources :random_sentences
  resources :sentence_scores
  resources :student_levels
  devise_for :users
  resources :mcm_topics
  get 'hello_world', to: 'hello_world#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
