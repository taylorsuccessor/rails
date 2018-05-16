Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #resources :brands, only: [:index, :show] do
   scope  "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
       resources :car, :user
   end
end
