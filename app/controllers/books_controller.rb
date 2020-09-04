class BooksController < ApplicationController
before_action :set_book, only: [:show, :edit, :update, :destroy]

protect_from_forgery :except => [:destroy]

 def top
 end

 def index
    @books = Book.all
    @book = Book.new
 end

 def create
    @book = Book.new(book_params)
    @books = Book.all
    if @book.save
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(@book)
    else
    render template: "books/index"
    end
 end

 def show
 end

 def edit
 end

 def update
   if @book.update(book_params)
   flash[:notice] = "Book was successfully updated."
   redirect_to book_path(@book)
   else
   render "edit"
   end
 end

 def destroy
   if @book.destroy
   flash[:notice] = "Book was successfully destroyed."
   redirect_to books_path
   else
   render index
   end
 end

private
  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
