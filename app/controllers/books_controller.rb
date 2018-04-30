class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end


  def create
    ### ここから追記
    @book = Book.new(book_params)
    # 上の行はインスタンスを作っただけ。saveメソッドで保存しないと、消える。
    # モデルのデータをデータベースに反映
    @book.save

    # 処理の後はindex画面を表示する
    redirect_to books_path
    ### ここまで
  end
  def update
    @book=Book.find(params[:id])
    @book.update(book_params)
    redirect_to(book_path(@book))
  end
  def edit
    @book=Book.find(params[:id])
  end

  def destroy
    
  end


  ### ここから追記
  private

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
