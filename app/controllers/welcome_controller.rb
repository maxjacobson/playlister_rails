class WelcomeController < ApplicationController
  def index
    scrape if Song.count == 0
  end

  def scrape
    scraper = SongScraper.new
    scraper.whee!
  end

end
