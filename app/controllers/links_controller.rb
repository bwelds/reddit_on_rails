class LinksController < ApplicationController
	def show
  	end

  	def new
  		@link = Link.new
  	end

  	def create
  		@link = Link.new(params[:link])

		respond_to do |format|
  			if @link.save
   				format.html { render :action => "show" }
   				format.json { render :json => @link }
 			else
    			format.html { render :action => "new" }
  		 		format.json { render :json => @link.errors, :status => :unprocessable_entity }
 			end
		end  
  	end
end
