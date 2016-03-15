require 'rails_helper'
require 'benchmark'
RSpec.describe ModelsController, type: :controller do
  fixtures :brands, :models

  describe "GET index" do
    it "assigns @brands" do
      get :index, {brand_id: brands(:one).id}
      expect(assigns(:models)).to include(models(:one))
    end

    it "renders the index template" do
      get :index, {brand_id: brands(:one).id}
      expect(response).to have_http_status(:ok)
      expect(response).to render_template("index")
    end
  end
end
