require 'rails_helper'

RSpec.describe FiguresController, type: :controller do
  # before(:context) do
    let!(:figures) { FactoryGirl.create_list(:figure, 3)}
  # end

  context 'with valid attributes' do
      describe 'GET #index' do
        it 'respond with a 200 status code' do
          get :index
          expect(response.status).to eq(200)
        end

        it 'return all figures' do
          get :index
          expect(assigns(:figures)).to eq(figures)
        end

        it 'returns the figures that match the specified search value' do
          spiderman = FactoryGirl.create(:figure, { name: 'Spiderman', release_date: '2016-05-29', character_id: 1 })
          get :index, search: 'Spiderman'
          expect(assigns(:figures).first).to eq (spiderman)
        end
      end

      describe 'GET #show' do
        it 'respond with a 200 status code' do
          get :show, id: figures.first
          expect(response.status).to eq(200)
        end

        it 'shows a figure' do
          get :show, id: figures.first
          expect(assigns(:figure)).to eq(figures.first)
        end
      end

      describe 'POST #create' do
        it 'respond with a 302 status code' do
          post :create, figure: attributes_for(:figure)
          expect(response.status).to eq(302)
        end

        it 'redirects to /figures after creating a figure' do
          post :create, figure: attributes_for(:figure)
          expect(response).to redirect_to figures_path notice: 'Figure was successfully created.'
        end

        it 'creates a figure' do
          expect(post :create, figure: attributes_for(:figure)).to change{Figure.length}.by(1)
        end
      end
    #
    #   describe 'PUT #update' do
    #     it 'update a figure' do
    #       put :update, id: figures.first, figure: { name: 'Spiderman', release_date: '2016/05/05', character_id: 1 }
    #       figures.first.reload
    #       expect(figures.first.name).to eq('Spiderman')
    #     end
    #   end
    #
    # describe 'DELETE method' do
    #   it 'destroy a figure' do
    #     expect {delete :destroy, id: figures.first}.to change(Figure, :count).by(-1)
    #   end
    # end

  end

  # context 'with invalid attributes' do
  #   describe 'GET #show with no existence id' do
  #     # it 'return a 404 code on the response' do
  #     #   # nonExistenceFigure = Figure.new(name: 'Spiderman', release_date: '2016-05-29', character_id: 1)
  #     #   # expect((get :show, id: 'non_existent_id').response.staut).to eq(404)
  #     #   expect(get :show, id: 'non_existent_id').not_to be_routable
  #     # end
  #   end
  # end
end
