class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user


  end
   def new
    @book = Book.new
   end

  def edit
    @book = Book.find(params[:id])
    @user = User.find(params[:id])
   unless @user.id == current_user.id
    redirect_to books_path
   end
  end

  def show
   @book = Book.find(params[:id])
   @book_new = Book.new
   @user = @book.user

  end

  def update
    @book = Book.find(params[:id])
   if @book.update(book_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to book_path(@book.id)
   else
    render :edit
   end

  end
  def destroy
    @book = Book.find(params[:id])  # データ（レコード）を1件取得
    @book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end

   def create
     @book = Book.new(book_params)
     @book.user_id = current_user.id
   if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
   else
      @books = Book.all
      @user = current_user
      render :index
   end
   end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end