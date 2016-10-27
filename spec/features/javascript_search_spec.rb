feature 'JavaScript search controller' do
  it 'should not have JavaScript errors', js: true do
    visit '/job-lookup/search'
    expect(page).not_to have_errors
  end
  it 'should use employee-lookup to retrieve a single job result', js: true do
    visit '/job-lookup/search'
    fill_in 'nd_employee_lookup_first_name', with: 'B'
    fill_in 'nd_employee_lookup_last_name', with: 'Murphy'
    find('#b_nd_employee_lookup_find').click

    selector = find('#nd_employee_lookup_select_employee')
    selector.find('span.emp_sel_first', text: 'Barbara').click

    job = find('#jobs_list .employee_job')
    expect(job).to have_selector('.job_title', text: 'Surviving Spouse Administrator')
  end
  it 'should find a person with more than one active job', js: true do
    visit '/job-lookup/search'
    fill_in 'nd_employee_lookup_net_id', with: '900000381'
    find('#b_nd_employee_lookup_find').click

    jobs = find('#jobs_list')
    expect(jobs).to have_selector('.job_title', text: 'Food Prod Kitchen Associate')
    expect(jobs).to have_selector('.job_title', text: 'Retired Staff')
  end
  it 'should show a message and not error when a person has no job', js: true do
    visit '/job-lookup/search'
    fill_in 'nd_employee_lookup_first_name', with: 'B'
    fill_in 'nd_employee_lookup_last_name', with: 'Murphy'
    find('#b_nd_employee_lookup_find').click

    selector = find('#nd_employee_lookup_select_employee')
    selector.find('span.emp_sel_net_id', text: 'BMURPH22').click

    expect(find('#jobs_list .employee_job')).to have_content 'There are no active jobs'
  end
end
