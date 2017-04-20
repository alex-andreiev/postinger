class AddColumsTokenOkAndTokenOkrToAccount < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :tokenok, :string
    add_column :accounts, :token_okr, :string
  end
end
