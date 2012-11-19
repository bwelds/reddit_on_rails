class SearchController < ApplicationController
	def index
		params[:per_page] 	||= 20
		params[:page]		||= 1

		@links = Link.search(:title => params[:q]).page(params[:page].to_i).per_page(params[:per_page])
	end
end
