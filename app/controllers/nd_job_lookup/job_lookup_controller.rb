require_dependency "nd_job_lookup/application_controller"

module NdJobLookup
  class JobLookupController < ApplicationController
    def new
    end

    def search
      json = HrpyEmployeeJob.search(params)
      search_results = JSON.parse(json)
      if search_results.empty?
        render :json => JSON.parse('[{ "Job": "None" }]')
      else
        render :json => search_results
      end
    end
  end
end
