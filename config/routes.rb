Rails.application.routes.draw do

  root :to => "home#index"

  scope '/arduino' do
              get    '/'      => 'home#arduino',   as: :arduino
              get '/getMoistureData' => 'home#getMoistureData'
              get '/getVoltageData' => 'home#getVoltageData'
              post '/postSensorData' => 'home#postSensorData'
  end

  # devise_for :users, skip: [:sessions]
  #
  #   as :user do
  #     get 'signin', to: 'devise/sessions#new', as: :new_user_session
  #     post 'signin', to: 'devise/sessions#create', as: :user_session
  #     delete 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session
  #
  #   end


  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout'}

end
