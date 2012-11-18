require 'spec_helper'

describe Movie do
  #describe 'getting Similar movies by director' do
    #context 'has director' do
    #  it 'should return movie by id' do
    #    fake_results = mock('Movie', director: 'George Lucas')
    #    Movie.find('1').should == fake_results
    #  end
    #end
    #context 'no director' do
    #  it 'should return nil' do
    #    fake_results = mock('Movie', director: 'George Lucas')
    #    Movie.find_all_by_director('George Lucas')
    #    assigns(:movies).should == fake_results
    #  end
      #it 'should raise InvalidKeyError if key not given' do
      #  Movie.stub(:api_key).and_return('')
      #  lambda { Movie.find_in_tmdb('Inception') }.
      #    should raise_error(Movie::InvalidKeyError)
      #end
      #it 'should raise InvalidKeyError if key is bad' do
      #  TmdbMovie.stub(:find).
      #    and_raise(RuntimeError.new('API returned code 404'))
      #  lambda { Movie.find_in_tmdb('Inception') }.
      #    should raise_error(Movie::InvalidKeyError)
      #end
    #end
  #end
end
