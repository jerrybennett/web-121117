class SongsController < ApplicationController
  get "/songs" do
    @songs = Song.all
    erb :"songs/index"
  end

  get "/songs/new" do
    erb :"songs/new"
  end

  post "/songs" do
    @artist = Artist.find_or_create_by(name: params[:song][:artist_name])
    @song = Song.new(name: params[:song][:name])
    @song.artist = @artist
    @song.save
    redirect "/songs/#{@song.id}"
  end



  patch "/songs/:id" do
    @song = Song.find(params[:id])
    @song.update(name: params[:name], rating: params[:rating])
    redirect "/songs/#{@song.id}"
  end

  get "/songs/:id" do
    @song = Song.find(params[:id])
    erb :"songs/show"
  end

  get "/songs/:id/edit" do
    @song = Song.find(params[:id])
    erb :"songs/edit"
  end




end
