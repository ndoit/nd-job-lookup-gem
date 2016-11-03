class EmployeesController < ApplicationController
  def show
    e = params[:employee_lookup][:employee]
    @employee = NdEmployeeLookup::Employee.new(e.symbolize_keys)
    jobs_params = { pidm: @employee.pidm.to_s,
                    start_date: DateTime.now.to_date.to_s }
    employee_jobs_json = NdJobLookup::HrpyEmployeeJob.search(jobs_params)
    employee_jobs_array = JSON.parse(employee_jobs_json)

    unless employee_jobs_array[0]['Job'] == "None"
      employee_jobs_array.each do |job|
        @employee.employee_jobs.new(job)
      end
    end
    @employee_jobs = @employee.employee_jobs
  end
end
