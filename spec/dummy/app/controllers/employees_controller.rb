class EmployeesController < ApplicationController
  def show
    @employee = params[:employee_lookup][:employee]
    jobs_params = { pidm: @employee['pidm'],
                    start_date: DateTime.now.to_date.to_s }
    employee_jobs_json = NdJobLookup::HrpyEmployeeJob.search(jobs_params)
    @employee_jobs = JSON.parse(employee_jobs_json)
  end
end
