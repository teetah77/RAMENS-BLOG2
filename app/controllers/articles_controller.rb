class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    article.update!(article_params)
    redirect_to articles_url, notice: "記事「#{article.title}」を更新しました。"
  end

  def create
    article = Article.new(article_params)

    if article.save!
      redirect_to @article, notice: "記事「#{article.title}」を登録しました。"
    else
      render :new
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to articles_url, notice: "記事「#{article.title}」を削除しました。"
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
