require 'rails_helper'

RSpec.describe TagsController, type: :controller do
  describe '#index' do
    it 'render :index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe '#new' do
    it 'render :new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe '#create' do
    context 'when tag is valid' do
      let(:tags_params) { attributes_for :tag }

      it 'creates tag record' do
        expect { post :create, tag: tags_params }.to change{ Tag.count }.by(1)
      end
    end

    context 'when tag is not valid' do
      let(:tags_params) { { label: nil } }

      it 'creates tag record' do
        expect { post :create, tag: tags_params }.to change{ Tag.count }.by(0)
      end
    end
  end
end
