
Rails.application.routes.draw do
  namespace :api do
    resources :questions, only: %i[index show create destroy update]
  end
end