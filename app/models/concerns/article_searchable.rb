module ArticleSearchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    settings index: {
      number_of_shards: 1,
      analysis: {
        analyzer: {
          title_matching: {
            type: :custom,
            tokenizer: :standard,
            filter: [ :lowercase, :asciifolding ]
          }
        }
      }
    } do
      mappings dynamic: false do
        indexes :id,    type: :integer
        indexes :title, type: :text, analyzer: :title_matching
      end
    end

    def as_indexed_json(options = nil)
      self.as_json( only: %i[id title state] )
    end
  end
end



