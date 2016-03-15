require 'rails_helper'
require 'benchmark'
RSpec.describe HomeController, type: :controller do
  fixtures :brands

  describe "GET index" do
    it "assigns @brands" do
      get :index
      expect(assigns(:brands)).to include(brands(:one))
    end

    it "renders the index template" do
      get :index
      expect(response).to have_http_status(:ok)
      expect(response).to render_template("index")
    end
  end
end
