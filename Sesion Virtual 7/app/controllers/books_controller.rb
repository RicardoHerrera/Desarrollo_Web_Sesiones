class BooksController < ApplicationController
  def edit
  	@book = Book.find(params[:id])
  end

  def index
  end

  def new
  	@book = Book.new
  end

  def create
  	@book = Book.new(book_params)
  	if @book.save
  		redirect_to 'books/show'
  	else
  		render :new
  	end
  end

  def show
  	@books = []
  	search = params[:searchString]

  	if search.nil? || search.empty? 
  		return
  	end
  	result = Book.where(["titulo LIKE ? OR autor LIKE ?", "%#{search}%", "%#{search}%"])
  	#result = Book.where(["titulo LIKE ?", "%#{search}%"]).where(["titulo LIKE ?", "%#{search}%"])
  	if result.count > 0
  		@books = result
  	else
  		@books = []
  	end
  end

  private
  def book_params
  	params.require(:book).permit(:titulo, :autor, :descripcion, :fecha_publicacion, :precio)
  end

end
