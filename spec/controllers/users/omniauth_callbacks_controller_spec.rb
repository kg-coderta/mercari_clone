require 'rails_helper'

describe Users::OmniauthCallbacksController, type: :controller do
  describe 'GET #goo' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end
end