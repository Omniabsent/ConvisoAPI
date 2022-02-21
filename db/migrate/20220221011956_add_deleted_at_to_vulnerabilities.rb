class AddDeletedAtToVulnerabilities < ActiveRecord::Migration[7.0]
  def change
    add_column :vulnerabilities, :deleted_at, :datetime
    add_index :vulnerabilities, :deleted_at
  end
end
