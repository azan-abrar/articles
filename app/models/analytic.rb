class Analytic < ApplicationRecord
  include AnalyticSearchable

  class << self
    def record(keyword)
      analytic = AnalyticSearch.new(:find_analytic, { keyword: keyword }).execute
      analytic = Analytic.create(keyword: keyword) if analytic.blank?
      analytic.increment!(:count)
    end
  end
end
