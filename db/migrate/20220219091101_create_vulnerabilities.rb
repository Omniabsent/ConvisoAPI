class CreateVulnerabilities < ActiveRecord::Migration[7.0]
  def change
    create_table :vulnerabilities do |t|
      t.string :name
      t.string :description
      t.integer :impact_level
      t.string :solution
      t.integer :status
      
      t.timestamps
    end
  end
end
