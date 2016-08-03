require 'rails_helper'

RSpec.describe FiguresController, type: :controller do
  describe 'GET #index' do
    context 'with figures created' do
      before(:each) do
        @figures = FactoryGirl.create_list(:figure, 3)
      end

      it 'respond with a 200 status code' do
        get :index
        expect(response.status).to eq(200)
      end

      it 'return all figures' do
        get :index
        expect(assigns(:figures)).to eq(@figures)
      end

      it 'returns the figures that match the specified search value' do
        spiderman = FactoryGirl.create(:figure, { name: 'Spiderman', release_date: '2016-05-29', character_id: 1 })
        get :index, search: 'Spiderman'
        expect(assigns(:figures).first).to eq (spiderman)
      end
    end

    context 'with no figures created' do
      it 'renders new figure template' do
        get :index
        expect(response).to render_template("layouts/application")
        expect(response).to render_template("figures/new")
      end
    end
  end

  describe 'GET #show' do
    context 'with valid id' do
      before(:each) do
        @figures = FactoryGirl.create_list(:figure, 3)
      end

      it 'respond with a 200 status code' do
        get :show, id: @figures.first
        expect(response.status).to eq(200)
      end

      it 'shows a figure' do
        get :show, id: @figures.first
        expect(assigns(:figure)).to eq(@figures.first)
      end
    end

    context 'with invalid id' do
      it "render template for 404 status code" do
        get :show, id: 'non_existent_id'
        expect(response).to render_template(file: "#{Rails.root}/public/404.html")
      end

      it 'respond with a 404 status code' do
        get :show, id: 'non_existent_id'
        expect(response.code).to eq("404")
      end
    end
  end

  describe 'GET #new' do
    it 'respond with a 200 status code' do
      get :new
      expect(response.status).to eq(200)
    end

    it 'renders new figure template' do
      get :index
      expect(response).to render_template("layouts/application")
      expect(response).to render_template("figures/new")
    end
  end

  describe 'GET #edit' do
    context 'with valid id' do
      before(:each) do
        @figures = FactoryGirl.create_list(:figure, 1)
      end

      it 'finds the figure' do
        get :edit, id: @figures.first
        expect(assigns(:figure)).to eq(@figures.first)
      end
    end

    context 'with invalid id' do
      it "render template for 404 status code" do
        get :edit, id: 'non_existent_id'
        expect(response).to render_template(file: "#{Rails.root}/public/404.html")
      end

      it 'respond with a 404 status code' do
        get :edit, id: 'non_existent_id'
        expect(response.code).to eq("404")
      end
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'respond with a 302 status code' do
        post :create, figure: attributes_for(:figure)
        expect(response.status).to eq(302)
      end

      it 'redirects to /figures after creating a figure' do
        post :create, figure: attributes_for(:figure)
        expect(response).to redirect_to figures_path notice: 'Figure was successfully created.'
      end

      it 'creates a figure' do
        expect {post :create, figure: attributes_for(:figure)}.to change(Figure, :count).by(1)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid attributes' do
      before(:each) do
        @figures = FactoryGirl.create_list(:figure, 3)
      end

    # 302: URL redirection.
      it 'respond with a 302 status code' do
        put :update, id: @figures.first, figure: { name: 'Spiderman', release_date: '2016/05/05', character_id: 1 }
        expect(response.status).to eq(302)
      end

      it 'update a figure' do
        put :update, id: @figures.first, figure: { name: 'Spiderman', release_date: '2016/05/05', character_id: 1 }
        @figures.first.reload
        expect(@figures.first.name).to eq('Spiderman')
      end
    end
  end

  describe 'DELETE method' do
    context 'with valid attributes' do
      before(:each) do
        @figures = FactoryGirl.create_list(:figure, 3)
      end

      it 'respond with a 302 status code' do
        delete :destroy, id: @figures.first
        expect(response.status).to eq(302)
      end

      it 'destroy a figure' do
        expect {delete :destroy, id: @figures.first}.to change(Figure, :count).by(-1)
      end
    end
  end
end
