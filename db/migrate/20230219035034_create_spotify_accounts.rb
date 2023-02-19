class CreateSpotifyAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :spotify_accounts do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name
      t.string :nickname
      t.string :email
      t.string :image
      t.string :token
      t.string :secret
      t.string :refresh_token

      t.timestamps
    end
  end
end
