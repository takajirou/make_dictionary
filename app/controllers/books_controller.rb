class BooksController < ApplicationController
  def search
    @book = Book.new
      if params[:search].nil?
      elsif params[:search].blank?
        flash.now[:danger] = "検索キーワードが入力されていません"
      else
        url = "https://www.googleapis.com/books/v1/volumes"
        text = params[:search]
        res = Faraday.get(url, q: text, langRestrict: "ja", maxResults: 20)
        @google_books = JSON.parse(res.body)
      end
  end

  def create
    @book = current_user.books.build(book_params)
    # モデルに書いたsave_with_authorメソッドを実行する
    if @book.save_with_author(authors_params[:authors])
      redirect_to books_path, success: t(".success")
    else
      flash.now[:danger] = t(".fail")
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :image_link, :info_link, :published_date, :systemid)
  end

  # authorsは配列で渡ってくるので、配受け取れるように記載
  def authors_params
    params.require(:book).permit(authors: [])
  end
end
