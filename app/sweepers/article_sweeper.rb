class ArticleSweeper < ActionController::Caching::Sweeper
  observe Article

  def after_save(record)
    expire_page(games_path)
  end

end
