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
  end

  def show
   @book = Book.find(params[:id])
   @book_new = Book.new
   
  end

  def update
    @book = Book.find(params[:id])
    @book.update(Book_params)
    redirect_to Book_path(Book.id)
  end
  def destroy
    @book = Book.find(params[:id])  # データ（レコード）を1件取得
    @book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end

   def create
     @book = Book.new(book_params)
     @book.user_id = current_user.id
     @book.save
   if @book.save
      redirect_to book_path(@book.id)
   else
      @books = Book.all
      render :index
   end
   end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end