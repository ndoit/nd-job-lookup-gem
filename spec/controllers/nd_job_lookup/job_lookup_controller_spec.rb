module NdJobLookup
  RSpec.describe JobLookupController, type: :controller do
    render_views
    routes { NdJobLookup::Engine.routes }

    describe 'GET #new' do
      it "renders the search form as a partial" do
        get :new
        expect(response).to render_template(partial: '_job_search')
      end
    end
  end
end
