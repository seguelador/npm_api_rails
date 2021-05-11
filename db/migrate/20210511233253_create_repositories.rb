class CreateRepositories < ActiveRecord::Migration[6.1]
  def change
    create_table :repositories do |t|
      t.string :name
      t.string :version
      t.text :description
      t.string :url
      t.string :publisher

      t.timestamps
    end
  end
end
