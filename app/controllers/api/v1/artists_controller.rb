class Api::V1::ArtistsController < ApplicationController
  respond_to :json

	def index
		respond_with Artist.all
	end

	def show
		respond_with Artist.find(params[:id])
	end

end