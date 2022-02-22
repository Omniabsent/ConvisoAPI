class AddIndexToVulnerabilities < ActiveRecord::Migration[7.0]
  def change
    add_index :vulnerabilities, :name
    add_index :vulnerabilities, :impact_level
    add_index :vulnerabilities, :status
  end
end
