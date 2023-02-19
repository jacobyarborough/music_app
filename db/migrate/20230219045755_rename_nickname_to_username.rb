class RenameNicknameToUsername < ActiveRecord::Migration[7.0]
  def change
    change_table :spotify_accounts do |t|
      t.rename :nickname, :username
    end
  end
end
