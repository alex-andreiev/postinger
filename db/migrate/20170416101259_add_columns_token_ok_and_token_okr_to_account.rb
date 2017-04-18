class AddColumnsTokenOkAndTokenOkrToAccount < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :token_odnoklassniki, :string
  end
end
