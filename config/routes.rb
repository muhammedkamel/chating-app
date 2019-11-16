Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :applications, only: %i[index create show update] do
    resources :chats, only: %i[index create show update] do
      resources :messages, only: %i[index create show update]
    end
  end
end
