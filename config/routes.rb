NdJobLookup::Engine.routes.draw do
  get '/search' => 'job_lookup#new'
end

Rails.application.routes.draw do
  mount NdJobLookup::Engine, at: '/job-lookup'
end
