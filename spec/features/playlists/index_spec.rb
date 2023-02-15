require "rails_helper"

RSpec.describe "playlists index page", type: :feature do 
  it "displays all playlists" do 
    talking_heads = Artist.create!(name: "Talking Heads")
    jgb = Artist.create!(name: "Jerry Garcia Band")
    prince = Artist.create!(name: "Prince")

    place = talking_heads.songs.create!(title: "This Must Be The Place", length: 56, play_count: 2540)
    breadbox = jgb.songs.create!(title: "Aint No Bread In The Breadbox", length: 890, play_count: 25)
    r_and_c = jgb.songs.create!(title: "Reuben and Chersie", length: 945, play_count: 2456)
    hello = prince.songs.create!(title: "Hello", length: 5489, play_count: 21498)

    jams = Playlist.create!(name: "Jams")
    uplifting_sounds = Playlist.create!(name: "Uplifting Sounds")

    rock = breadbox.playlists.create!(name: "Classic Rock")

    purple = uplifting_sounds.songs.create!(title: "Purple Rain", length: 600, play_count: 8945, artist: prince)

    PlaylistSong.create!(song: purple, playlist: jams)
    PlaylistSong.create!(song: place, playlist: jams)

    rock.songs << place 
    r_and_c.playlists << rock 

    visit "/playlists"

    within("#playlist-#{rock.id}") do 
      expect(page).to have_content(rock.name)
      click_on("#{rock.name}")
      expect(page).to have_current_path("/playlists/#{rock.id}")
    end 

    click_on("Playlists")
    expect(page).to have_current_path(playlists_path)

    within("#playlist-#{uplifting_sounds.id}") do 
      expect(page).to have_content(uplifting_sounds.name)
    end 

    within("#playlist-#{jams.id}") do 
      expect(page).to have_content(jams.name)
    end 
  end
end 