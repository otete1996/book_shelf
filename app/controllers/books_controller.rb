class BooksController < ApplicationController
  before_action :set_book ,only: [:show,:update,:edit,:destroy]

  def index
    @books = Book.all
  end

  def show

  end

  def new
    @book = Book.new
  end


  def create
    ### ここから追記
    @book = Book.new(book_params)
    # 上の行はインスタンスを作っただけ。saveメソッドで保存しないと、消える。
    # モデルのデータをデータベースに反映
    if @book.save
      redirect_to books_path
    else
      flash.now[:alert]=@book.errors.full_messages
      render :new
    end


    # 処理の後はindex画面を表示する

    ### ここまで
  end
  def update

    if @book.update(book_params)

      redirect_to(book_path(@book))
    else
      flash.now[:alert]=@book.errors.full_messages
      render :edit
    end
  end
  def edit

  end

  def destroy

    @book.destroy
    redirect_to(books_path)
  end



  ### ここから追記
  private

def set_book
  @book=Book.find(params[:id])
end
  # params.require(key).permit(filter)
  # key
  #   Strong Parameters を適用したい params の key を指定する。
  # filter
  #   Strong Parameters で許可するカラムを指定する。

  def book_params
    params.require(:book).permit(:name, :price, :publish, :publish_date)
  end
  ### ここまで
end
