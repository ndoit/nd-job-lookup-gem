feature 'JavaScript search controller' do
  it 'should not have JavaScript errors', js: true do
    visit '/job-lookup/search'
    expect(page).not_to have_errors
  end
  it 'should use employee-lookup to retrieve a single job result', js: true do
    pending "the spec for employee-lookup-gem has been broken"
    raise Error
  end
  it 'should find a person with more than one active job', js: true do
    pending "the job-lookup is implemented abstractly and does not provide show"
    raise Error
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
