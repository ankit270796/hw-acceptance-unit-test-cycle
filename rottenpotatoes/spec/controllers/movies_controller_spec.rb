require 'rails_helper'

describe MoviesController do
  describe 'Search movies by the same director' do
    it 'should call Movie.similar_movies' do
      expect(Movie).to receive(:similar_movies).with('Aladdin')
      get :search, { title: 'Aladdin' }
    end

    it 'should assign similar movies if director exists' do
      movies = ['Seven', 'The Social Network']
      Movie.stub(:similar_movies).with('Seven').and_return(movies)
      get :search, { title: 'Seven' }
      expect(assigns(:similar_movies)).to eql(movies)
    end

    it "should redirect to home page if director isn't known" do
      Movie.stub(:similar_movies).with('No name').and_return(nil)
      get :search, { title: 'No name' }
      expect(response).to redirect_to(movies_path)
    end
  end

  describe 'Update Movie' do

    let!(:movie1) { FactoryBot.create(:movie, title: 'Catch me if you can', director: 'Steven Spielberg')}

    it 'should update the details' do
      put :update, {id: movie1.id, :movie => { 'director' => 'ding dong'}}
      expect(flash[:notice]).to match(/was successfully updated/)
      expect(response).to redirect_to(movie_path)
    end
  end

  describe 'Index testing' do

    it 'should title sort the movies' do
      get :index, {sort: 'title'}
      actual_order = Movie.order(:title)
      expect(actual_order).to eq(actual_order.sort)
    end

    it 'should date sort the movies' do
      get :index, {sort: 'release_date'}
      actual_order = Movie.order(:release_date)
      expect(actual_order).to eq(actual_order.sort)
    end

  end

  describe 'Create Movie' do 

    it 'should create a movie entry' do
      post :create, movie: { title: 'ping pong',director: 'ding dong',rating: 'R', description: 'random',:release_date => '6-Apr-1968'} 
      expect(flash[:notice]).to match(/was successfully created/)
      expect(response).to redirect_to(movies_path)
    end

  end

  describe 'Delete movie' do

    let!(:movie1) { FactoryBot.create(:movie, title: 'Catch me if you can', director: 'Steven Spielberg')}

    it 'should set the flash' do
      delete :destroy, {id: movie1.id}
      expect(flash[:notice]).to match(/deleted/)
      expect(response).to redirect_to(movies_path)
    end
  end
  
end
