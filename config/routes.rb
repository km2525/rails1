Rails.application.routes.draw do
  resources :schedules
  
  get "up" => "rails/health#show"
  get "service-worker" => "rails/pwa#service_worker"
  get "manifest" => "rails/pwa#manifest"
end
