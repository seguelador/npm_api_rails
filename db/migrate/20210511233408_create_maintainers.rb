class CreateMaintainers < ActiveRecord::Migration[6.1]
  def change
    create_table :maintainers do |t|
      t.string :name
      t.repository :references

      t.timestamps
    end
  end
end
