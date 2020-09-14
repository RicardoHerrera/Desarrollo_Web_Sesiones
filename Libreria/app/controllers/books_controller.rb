class BooksController < ApplicationController
  
  #,  :only => [:nombremetoro], :except => [:new]
  before_action :find_author

  def index
    # Obtner el id del author en los parametros    
    # Obtener el author con el id recibido
    # @author = Author.find(params[:author_id])
    # Buscar los libros del author
    @books = @author.books
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new(:author_id => @author.id)
    # @authors = []
    # Author.all.map { |author| @authors.append([author.nombre, author.id]) }
  end

  def create
    @book = Book.create(book_params)
    @book.author = @author
    if @book.save 
      redirect_to(books_path(:author_id => @author.id))
    else
      render 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
    # @authors = []
    # Author.all.map { |author| @authors.append([author.nombre, author.id]) }
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      redirect_to(book_path(@book, :author_id => @author.id))
    else
      @authors = []
      Author.all.map { |author| @authors.append([author.nombre, author.id]) }
      render('edit')
    end
  end

  def delete
  end

  private 

  def book_params
    params.require(:book).permit(:titulo, :author_id, :visible, :descripcion, :estado)
  end

  def find_author
    @author = Author.find(params[:author_id])
  end

end