class Api::V1::LyricsController < ApplicationController
	respond_to :json

	def show
		respond_with Lyric.find(params[:id])
	end

end