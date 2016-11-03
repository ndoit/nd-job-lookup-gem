class CreateNdJobLookupEmployeeJobs < ActiveRecord::Migration
  def change
    create_table :nd_job_lookup_employee_jobs do |t|
      t.integer :employee_id
      t.integer :pidm
      t.text :posn
      t.text :suffix
      t.text :employee_class
      t.text :primary
      t.date :start_date
      t.date :end_date
      t.text :title
      t.text :status
      t.text :status_description
      t.date :last_paid
      t.text :orgn_code
      t.text :orgn_title
      t.text :pict_code

      t.timestamps null: false
    end
  end
end
