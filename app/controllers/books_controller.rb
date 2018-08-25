class BooksController < ApplicationController
  before_action :authenticate_user!


    def index
      @books = Book.all
      @book = Book.new
    end

    def show
      @books = Book.find(params[:id])
      @book = Book.new
      @user = @books.user
    end

    def new
      @book = Book.new
    end

    def edit
      @book = Book.find(params[:id])
      certification
      end

    def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      if @book.save
        flash[:notice] = "successfully"
        redirect_to book_path(@book.id)
      else
        @books = Book.all
        @book = @book #エラー情報を格納
        logger.info(params[:action])
        render :template => "books/index"
      end
    end

    def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
        flash[:notice] = "successfully"
        redirect_to book_path(@book.id)
      else
        render :edit
      end
    end

    def destroy
      book = Book.find(params[:id])
      book.destroy
      flash[:notice] = "successfully"
      redirect_to root_path
    end

    private
        def book_params
            params.require(:book).permit(:book_title, :book_opinion, :user_id)
        end
        def certification
          if current_user.id != @book.user.id
            redirect_to user_path(current_user.id)
          end
        end
end
