class RemoveSecretFromSpotifyAccounts < ActiveRecord::Migration[7.0]
  def change
    remove_column :spotify_accounts, :secret, :string
  end
end
