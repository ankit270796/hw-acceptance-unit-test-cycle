require 'rails_helper'

describe Movie do
  describe '.find_similar_movies' do
    let!(:movie1) { FactoryBot.create(:movie, title: 'M1', director: 'D1') }
    let!(:movie2) { FactoryBot.create(:movie, title: 'M2', director: 'David Fincher') }
    let!(:movie3) { FactoryBot.create(:movie, title: 'M3', director: 'D1') }
    let!(:movie4) { FactoryBot.create(:movie, title: 'M4') }

    context 'director exists' do
      it 'finds similar movies correctly' do
        expect(Movie.similar_movies(movie1.title)).to eql(['M1','M3'])
        expect(Movie.similar_movies(movie1.title)).to_not include(['M2'])
        expect(Movie.similar_movies(movie2.title)).to eql(['M2'])
      end
    end

    context 'director does not exist' do
      it 'handles sad path' do
        expect(Movie.similar_movies(movie4.title)).to eql(nil)
      end
    end
  end

  describe '.all_ratings' do
    it 'returns all ratings' do
      expect(Movie.all_ratings).to match(%w(G PG PG-13 NC-17 R))
    end
  end
end
