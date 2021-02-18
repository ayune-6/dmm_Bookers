class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to '/'
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to '/'
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy(book_params)
    redirect_to '/'
  end

  private
  def book_params
    params.require(:Book).permit(:title, :body)
  end

end
