Rails.application.routes.draw do
  root to: 'cocktails#index'
  resources :cocktails do
    resources :doses, only: [ :new, :create ]
  end
  delete 'doses/:id', to: 'doses#destroy', as: :destroy_dose
end
