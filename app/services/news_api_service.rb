# frozen_string_literal: true

# Service object used to implement business needs from the News API.
# initialize creates the service object with a call to new.
# fetch_top_articles queries the representative and issue
# The language is expected to be in English and the origin from the US.

class NewsAPIService
  def initialize(api_key=Rails.application.credentials[:NEWS_API_KEY])
    @news_api = News.new(api_key)
  end

  def fetch_top_articles(representative_name, issue)
    query = "#{representative_name} #{issue}"
    articles = @news_api.get_top_headlines(q: query, language: 'en', country: 'us')
    articles.take(5)
  end
end