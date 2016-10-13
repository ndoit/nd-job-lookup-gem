describe "nd_job_lookup/job_lookup/new.html.erb" do
  it "renders the job_search partial" do
    render
    expect(view).to render_template(:new)
    expect(view).to render_template(partial: "_job_search")
  end
end
