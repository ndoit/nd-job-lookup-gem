NdJobLookup::Engine.routes.draw do
  get '/search' => 'job_lookup#new'
  get 'job/:pidm/p/:posn/:suffix' => 'job_lookup#search'
  get 'job/:pidm/:start_date(/:end_date)' => 'job_lookup#search'
end

Rails.application.routes.draw do
  mount NdJobLookup::Engine, at: '/job-lookup'
end
