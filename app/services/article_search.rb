class ArticleSearch
  def initialize(search_type, args)
    @search_type = search_type
    @args        = args
  end

  attr_reader :search_type, :args

  def execute
    case search_type
    when :find_articles
      find_articles
    when :all_articles
      all_articles
    end
  end

  private

  def find_articles
    query = {
      query: {
        query_string: {
          default_field: :title,
          query: "#{args[:keyword]}*",
          analyzer: :title_matching,
          default_operator: :and
        }
      }
    }

    Article.search(query).records
  end

  def all_articles
    query = {
      query: {
        match_all: {}
      }
    }

    Article.search(query).records
  end
end
