module NdJobLookup
  class EmployeeJob < ActiveRecord::Base
    belongs_to :employee, class_name: 'NdEmployeeLookup::Employee'
  end
end
