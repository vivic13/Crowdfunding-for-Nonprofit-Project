class HomeController < ApplicationController
	def about
		@page_title = "關於我們"
	end
	def contact
		@page_title = "聯絡我們"
	end

end
