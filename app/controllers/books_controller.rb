class BooksController < ApplicationController
  
  
  def new
    @book = Book.new
    @books = Book.all 
    @user = current_user 
  end
  
   # 投稿データの保存
  def create
    @books = Book.all 
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] ="You have created book successfully."
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
    @newbook = Book.new
     @book = Book.find(params[:id]) 
     @user = @book.user
  end
  
  def destroy
    book = Book.find(params[:id]) 
    book.destroy
    redirect_to '/books'
  end
  
  def edit
    @book = Book.find(params[:id])
  end
 
 def update
  @book = Book.find(params[:id]) 
  if @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)  
  else
    render :edit
  end
  
end
 
  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :image, :body)
  end
    
  end
  