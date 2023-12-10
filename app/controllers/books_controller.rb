class BooksController < ApplicationController
  
  def new
    @book = Book.new
  end
  
   # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to book_path(@book.id)
    else
      render :new
    end
  end
  

  
  def index
     @book = Book.new
    @books = Book.all 
    @user = current_user 
  end

  def show
     @book = Book.find(params[:id]) 
     @user = current_user 
  end
  
  def destroy
    book = Book.find(params[:id]) 
    book.destroy
    redirect_to '/books'
  end
  
  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :image, :body)
  end
  
  
end
