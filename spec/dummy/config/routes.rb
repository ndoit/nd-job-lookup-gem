Rails.application.routes.draw do

  mount NdJobLookup::Engine => "/nd_job_lookup"
end
