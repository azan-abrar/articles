module AnalyticSearchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    settings index: {
      number_of_shards: 1,
      analysis: {
        analyzer: {
          full_text_matching: { tokenizer: :keyword }
        }
      }
    } do
      mappings dynamic: false do
        indexes :id,      type: :integer
        indexes :count,   type: :integer
        indexes :keyword, type: :text, analyzer: :keyword
      end
    end

    def as_indexed_json(options = nil)
      self.as_json( only: %i[id count keyword] )
    end
  end
end
