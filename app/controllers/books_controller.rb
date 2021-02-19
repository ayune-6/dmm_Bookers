class BooksController < ApplicationController
  def home
  end

  def index
    @books = Book.all.order(:id)
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  # def new
  #   @book = Book.new
  # end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = 'Successfully posted!'
    #   flash.now[:alert] = 'Error: The post cannot be empty'
    # else
    #   render 'index'
      redirect_to books_path
    else
      @books = Book.all
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = 'Book was successfully updated.'
      redirect_to book_path(@book.id)
    else
      # @book = Book.find(params[:id])
      render 'edit'
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:success] = 'Book was successfully deleted.'
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
