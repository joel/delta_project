class CreateContracts < ActiveRecord::Migration[7.0]
  def change
    create_table :contracts do |t|
      t.string :title
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.datetime :signed_at
      t.datetime :approved_at
      t.datetime :activated_at

      t.timestamps
    end
  end
end
