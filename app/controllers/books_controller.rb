class BooksController < ApplicationController
  def show
  	  @book = Book.find(params[:id])
  end

  def index
  end

  def new
  	  @book = Book.new
  	  @books = Book.all
  end

  def create
  	  book = Book.new(book_params)
  	if book.save
      flash[:notice] = "Book was successfully created."
  	  redirect_to book_path(book)
    else
      render action: :new
    end
  end
   def destroy
   	   book = Book.find(params[:id])

   	  if book.destroy
         flash[:notice] = "Book wassuccessfully destroyed"
   	    redirect_to new_book_path
      else
        render action: :new
      end

   end

  def edit
  	  @book = Book.find(params[:id])
  end

  def update
      book = Book.find(params[:id])
    if  book.update(book_params)
      flash[:notice] = "Book was successfully updated"
      redirect_to book_path(book)
    else
      render action: :new
    end
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
