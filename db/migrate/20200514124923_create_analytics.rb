class CreateAnalytics < ActiveRecord::Migration[5.2]
  def change
    create_table :analytics do |t|
      t.integer :count, default: 0
      t.string  :keyword

      t.timestamps
    end
  end
end
