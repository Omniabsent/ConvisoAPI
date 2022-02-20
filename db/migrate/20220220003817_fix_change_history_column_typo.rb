class FixChangeHistoryColumnTypo < ActiveRecord::Migration[7.0]
  def change
    rename_column :change_histories, :vulnerabilty_status, :vulnerability_status
  end
end
