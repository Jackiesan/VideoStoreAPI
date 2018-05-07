require "test_helper"

describe MoviesController do
  it "should get index" do
    get movies_index_url
    value(response).must_be :success?
  end

  it "should get show" do
    get movies_show_url
    value(response).must_be :success?
  end

  it "should get new" do
    get movies_new_url
    value(response).must_be :success?
  end

  it "should get create" do
    get movies_create_url
    value(response).must_be :success?
  end

  it "should get destroy" do
    get movies_destroy_url
    value(response).must_be :success?
  end

  it "should get edit" do
    get movies_edit_url
    value(response).must_be :success?
  end

  it "should get update" do
    get movies_update_url
    value(response).must_be :success?
  end

end