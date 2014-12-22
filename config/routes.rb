Leadtracker::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


   root 'static_pages#front'

   resources :companies
   resources :agencies do
      get :reset_filterrific, on: :collection
   end
   resources :brands
   resources :users
   resources :sessions, only: [:create, :destroy]
   resources :actiontypes
   resources :categories, only: [:create, :new, :update, :edit, :destroy, :index]
   resources :actions do
    get :reset_filterrific, on: :collection
   end

   namespace :closingloop do
      resources :actions, only: [:edit, :update, :index]
   end

   get '/actions',              to: "leads#index"
   get '/billing',              to: "companies#billing", as: 'billing'
   get '/roi',                  to: "companies#roi_report", as: 'roi_report'
   get '/sign-in', 		          to: "sessions#new", as: 'sign_in'
   get '/sign-out',             to: "sessions#destroy"
   get '/ctm',                  to: "actions#create"
   get '/company/:id/users',    to: "companies#users", as: 'company_users'
   get '/agency/:id/users',     to: "agencies#users", as: 'agency_users'
   get '/agency/:id/companies', to: "agencies#index", as: 'agency_companies'

  end