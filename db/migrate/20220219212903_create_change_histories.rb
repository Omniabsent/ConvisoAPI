class CreateChangeHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :change_histories do |t|
      t.references :user, null: false, foreign_key: true
      t.references :vulnerability, null: false, foreign_key: true
      t.integer :vulnerabilty_status, null: false

      t.timestamps
    end
  end
end
