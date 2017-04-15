class Api::V1::AlbumsController < ApplicationController
	respond_to :json

	def show
		respond_with Album.find(params[:id])
	end

end

<a target="_blank" href="https://www.amazon.com/gp/dmusic/promotions/AmazonMusicUnlimited?ref_=assoc_tag_ph_1483579440886&_encoding=UTF8&camp=1789&creative=9325&linkCode=pf4&tag=letlyrics-20&linkId=d7a1bb8cf635a8e4d77a7b0c8e2fc2e4">Try Amazon Music Unlimited 30-Day Free Trial</a><img src="//ir-na.amazon-adsystem.com/e/ir?t=letlyrics-20&l=pf4&o=1" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />