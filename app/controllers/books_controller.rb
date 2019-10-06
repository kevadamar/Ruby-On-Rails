class BooksController < ApplicationController
  before_action :param_id, only: [:edit,:show, :update, :destroy]

  def index
    @books = Book.all.order(title: :asc)
  end

  def show
  end

  def new
      @book = Book.new
  end

  def create
    @book = Book.new param_permit

    if @book.save
      redirect_to books_path
    end
  end

  def edit
  end

  def update
    if @book.update param_permit
      redirect_to books_path
    else
      redirect_to books_path, notice: "buruk"
    end
  end

  def destroy
    if @book.destroy
      redirect_to books_path, notice: "Buku Berhasil Di Hapus"
    end
  end

  private

  def param_id
    @book = Book.find(params[:id])
  end

  def param_permit
    params.require(:book).permit(:title,:price,:page,:description)
  end

end
