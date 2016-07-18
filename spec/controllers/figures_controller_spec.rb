require 'rails_helper'

RSpec.describe FiguresController, type: :controller do

  let! (:figures) {FactoryGirl.create_list(:figure, 3)}

  describe 'GET #index' do
    it 'return all figures' do
      get :index
      expect(assigns(:figures)).to eq(figures)
    end
  end

  describe 'POST #create' do
    it 'creates a figure' do
      post :create, figure: attributes_for(:figure)
      expect(response).to redirect_to figures_path notice: 'Figure was successfully created.'
    end
  end

end
