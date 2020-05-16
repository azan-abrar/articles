class AnalyticSearch
  def initialize(search_type, args)
    @search_type = search_type
    @args        = args
  end

  attr_reader :search_type, :args

  def execute
    case search_type
    when :find_analytic
      find_analytic
    when :all_analytics
      all_analytics
    end
  end

  private

  def find_analytic
    query = {
      query: {
        bool: {
          must: {
            match: { keyword: args[:keyword] }
          }
        }
      }
    }

    Analytic.search(query).records.first
  end

  def all_analytics
    query = {
      query: {
        bool: {
          must: {
            match_all: {}
          }
        }
      }
    }

    Analytic.search(query).records
  end
end
