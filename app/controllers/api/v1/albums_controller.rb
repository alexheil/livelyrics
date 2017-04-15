class Api::V1::AlbumsController < ApplicationController
	respond_to :json

	def show
		respond_with Album.find(params[:id])
	end

end