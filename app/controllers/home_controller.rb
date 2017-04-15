class HomeController < ApplicationController
	def about
		@page_title = "關於蠋購"
	end
	def npos
		@page_title = "關於我們要幫助的公益團體"
	end
	def public
		@page_title = "合作對象"
	end
end
