feature 'JavaScript search controller' do
  it 'should not have JavaScript errors', js: true do
    visit '/job-lookup/search'
    expect(page).not_to have_errors
  end
end
