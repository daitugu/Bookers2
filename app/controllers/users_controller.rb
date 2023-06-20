class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end
  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end
  def edit
    @user = User.find(params[:id])
  end
end
