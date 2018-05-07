require "test_helper"

describe MoviesController do
  describe "index" do
    it "is a real working route" do
      get movies_url
      must_respond_with :success
    end

    it "returns json" do
      get movies_url
      response.header['Content-Type'].must_include 'json'
    end

    it "returns an Array" do
      get movies_url
      body = JSON.parse(response.body)
      body.must_be_kind_of Array
    end

    it "returns all of the movies" do
      get movies_url
      body = JSON.parse(response.body)
      body.length.must_equal Movie.count
    end

    it "returns movies with exactly the required fields" do
      keys = %w(id release_date title)
      get movies_url
      body = JSON.parse(response.body)
      body.each do |movie|
        movie.keys.sort.must_equal keys
      end
    end

    # NOTE: is this a good test?
    # it "returns empty array if there are no movies" do
    #
    # end
  end

  describe "show" do
    it "is a working route that recieves one movie" do
      get movie_path( movies(:harry).id )
      must_respond_with :success
    end

    it "returns one movie with required data" do
      keys = %w(inventory overview release_date title)
      get movie_path( movies(:harry).id )
      body = JSON.parse(response.body)
      body.keys.sort.must_equal keys
    end

    it "returns a 404 code for movies that do not exist" do
      movie = movies(:harry)
      movie.destroy
      get movie_path(movie.id)
      must_respond_with :bad_request
    end
  end

end
