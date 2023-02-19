class AddSpotifyUrlToSpotifyAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :spotify_accounts, :spotify_url, :string
  end
end
