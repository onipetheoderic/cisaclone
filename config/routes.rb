Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :messages
  resources :resources_customs
 mount Ckeditor::Engine => '/ckeditor'

  resources :programs
  resources :careers
  namespace :profile do
    get 'dashboard', to: 'dashboard#index'
    get 'all_unread', to: 'dashboard#all_unread'
    get 'all_read', to: 'dashboard#all_read'
    get 'message_show/:id', to: 'dashboard#message_show'
  end



  resources :campaigns do
    collection do
      get :non_activated_campaign
      get :activated_campaign
  end
end

resources :donation  do
  collection do
    get :campaign_show

  end
end



  resources :resource
  resources :campaign_categories
  resources :posts
  resources :admin
  # resources :blog
  # resources :donation


  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    unlocks: 'users/unlocks',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root 'home#index', as: :home
  get 'about-community-initiative-for-a-safer-africa'  => 'home#about_cisa', as: :about_cisa
  get 'cisa-causes' => 'home#causes', as: :cisa_causes
  get 'cisa-programs' => 'home#programs', as: :cisa_programs
  #Action_name Controller Wat we wanna see in the link
  get 'events' => 'home#events', as: :events
  get 'blog' => 'home#blog', as: :blog
  get 'contact' => 'contact_us#index', as: :contact_us
  post 'contact' => 'contact_us#create'
  post 'newsletter_subscribe' => 'home#newsletter_subscribe'
  get 'terms-and-conditions' => 'home#terms_and_conditions', as: :terms_and_conditions
  get 'privacy-policy' => 'home#privacy_policy', as: :privacy_policy
  post 'create_message' => 'home#create_message', as: :create_message
  get 'cisa-careers' => 'home#careers', as: :cisa_careers
  get 'cisa-careers/:id' => 'home#career_details', as: :cisa_career_details

  get 'cisa-resources' => 'home#resources', as: :cisa_resources
  get 'cisa-resources/:id' => 'home#resource_details', as: :cisa_resource_details

  post 'paystackurl' => 'donation#paystackUrl', as: :paystackurl
  post 'anonymous_donation' => 'home#anonymous_donation', as: :anonymous_donation
  get 'donation/success'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
