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
end
