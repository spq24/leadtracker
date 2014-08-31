Leadgenthree::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

   root 'static_pages#front'

   resources :companies
   resources :agencies
   resources :brands
   resources :users
   resources :sessions, only: [:create, :destroy]
   resources :actiontypes
   resources :reasoninquiries
   resources :nonleadactions
   resources :leads do
    get :reset_filterrific, on: :collection
   end

   namespace :closingloop do
      resources :leads, only: [:edit, :update, :index]
   end

   get '/leads',       to: "leads#index"
   get '/web-metrics', to: "companies#web_metrics", as: 'web_metrics'
   get '/billing',     to: "companies#billing", as: 'billing'
   get '/roi',         to: "companies#roi_report", as: 'roi_report'
   get '/sign-in', 		 to: "sessions#new", as: 'sign_in'
   get '/sign-out',    to: "sessions#destroy"
   get '/ctm',          to: "leads#create"

  end