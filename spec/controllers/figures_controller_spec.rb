require 'rails_helper'

RSpec.describe FiguresController, type: :controller do

  let! (:figures) {FactoryGirl.create_list(:figure, 3)}
  context 'with valid attributes' do

    context 'GET methods' do

      describe 'GET #index' do
        it 'return all figures' do
          get :index
          expect(assigns(:figures)).to eq(figures)
        end
      end

      describe 'GET #show' do
        it 'shows a figure' do
          get :show, id: figures.first
          expect(assigns(:figure)).to eq(figures.first)
        end
      end

    end

    context 'POST methods' do
      describe 'POST #create' do
        it 'creates a figure' do
          post :create, figure: attributes_for(:figure)
          expect(response).to redirect_to figures_path notice: 'Figure was successfully created.'
        end
      end
    end

    context 'PUT methods' do
      describe 'PUT #update' do
        it 'update a figure' do
          put :update, id: figures.first, figure: { name: 'Spiderman', release_date: '2016/05/05', character_id: 1 }
          figures.first.reload
          expect(figures.first.name).to eq('Spiderman')
        end
      end
    end

    describe 'DELETE method' do
      it 'destroy a figure' do
        expect {delete :destroy, id: figures.first}.to change(Figure, :count).by(-1)
      end
    end

  end

  context 'with invalid attributes' do

  end
end
