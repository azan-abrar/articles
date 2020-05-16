class AnalyticsController < ApplicationController
  def index
    @analytics = AnalyticSearch.new(:all_analytics, {}).execute
  end
end
