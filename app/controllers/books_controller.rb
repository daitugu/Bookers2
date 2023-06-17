class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end
  

  def show
   @book = Book.find(params[:id])
  end

  def update
  end

  def destroy
  end
  
  def create

  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end