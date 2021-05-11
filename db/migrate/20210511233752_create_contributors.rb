class CreateContributors < ActiveRecord::Migration[6.1]
  def change
    create_table :contributors do |t|
      t.string :name
      t.references :repository, null: false, foreign_key: true

      t.timestamps
    end
  end
end
