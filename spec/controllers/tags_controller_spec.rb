require 'rails_helper'

RSpec.describe TagsController, type: :controller do
  describe '#index' do
    it 'render index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
