class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  validates :body, presence: true
  	validates :user, presence: true
  	validates :product, presence: true
  	validates :rating, numericality: { only_integer: true}

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @product, notice: 'Thank you, your review has been received' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { redirect_to @product, alert: 'Sorry, but your review could not be saved' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
end
