class StaticPagesController < ApplicationController
	def landing_page
		@featured_product = Product.first
		@products = Product.all
		max_count = [@products.count, 5].min
		@products = @products.take(max_count)
	end
end
