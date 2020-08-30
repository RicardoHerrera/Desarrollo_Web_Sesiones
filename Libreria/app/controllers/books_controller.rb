class BooksController < ApplicationController
  
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @authors = []
    Author.all.map { |author| @authors.append([author.nombre, author.id]) }
  end

  def create
    @book = Book.create(book_params)
    if @book.save 
      redirect_to(books_path)
    else
      render 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
    @authors = []
    Author.all.map { |author| @authors.append([author.nombre, author.id]) }
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      redirect_to(book_path(@book))
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
end