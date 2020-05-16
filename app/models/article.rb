class Article < ApplicationRecord
  include ArticleSearchable

  after_commit on: [:create] do
    __elasticsearch__.index_document
  end

  after_commit on: [:update] do
    __elasticsearch__.update_document
  end

  after_commit on: [:destroy] do
    __elasticsearch__.delete_document
  end

  extend FriendlyId
  friendly_id :title, use: :slugged

  enum state: { published: 0, unpublished: 1 }

  validates :title, :description, :state, presence: true
  validates_length_of :description, minimum: 5, maximum: 50

  class << self
    def match_by_keyword(keyword)
      Analytic.record(keyword)
      ArticleSearch.new(:find_articles, { keyword: keyword }).execute
    end
  end
end
