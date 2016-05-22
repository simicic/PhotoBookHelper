require 'rails_helper'

RSpec.describe EventsController, type: :controller do
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

  describe '#show' do
    let(:event) { create :event }

    before { get :show, id: event.id }

    it 'render :show template' do
      expect(response).to render_template(:show)
    end

    it 'assigns event' do
      expect(assigns[:event]).to eq event
    end
  end

  describe '#create' do
    context 'when event is valid' do
      let(:event) { attributes_for :event }

      it 'creates event record' do
        expect { post :create, event: event }.to change{ Event.count }.by(1)
      end
    end

    context 'when event is not valid' do
      let(:events_params) { { label: nil } }

      it 'creates event record' do
        expect { post :create, event: events_params }.to change{ Event.count }.by(0)
      end
    end
  end
end
