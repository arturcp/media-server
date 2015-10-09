Rails.application.routes.draw do
  resources :images do
    get ':version', on: :member, action: :version, as: :version
  end
end
