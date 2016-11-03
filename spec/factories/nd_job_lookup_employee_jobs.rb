FactoryGirl.define do
  factory :nd_job_lookup_employee_job, class: 'NdJobLookup::EmployeeJob' do
    pidm 1
    posn "MyText"
    suffix "MyText"
    employee_class "MyText"
    primary "MyText"
    start_date "2016-11-03"
    end_date "2016-11-03"
    title "MyText"
    status "MyText"
    status_description "MyText"
    last_paid "2016-11-03"
    orgn_code "MyText"
    orgn_title "MyText"
    pict_code "MyText"
  end
end
