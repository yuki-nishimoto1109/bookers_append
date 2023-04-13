class SearchesController < ApplicationController
  def search
    @books = Book.search_by_keyword(params[:q], params[:regular])
    @users = User.search_by_keyword(params[:q], params[:regular])
  end
end
