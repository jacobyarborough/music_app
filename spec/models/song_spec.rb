require "rails_helper"

RSpec.describe Song, type: :model do 
  describe "validations" do 
    it { should validate_presence_of :title }
    it { should validate_presence_of :length }
    it { should validate_presence_of :play_count }
  end 

  describe "class methods" do 
    describe ".song_count" do 
      it "returns the number of songs in the db" do 
        prince = Artist.create!(name: 'Prince')
        talking_heads = Artist.create!(name: 'Talking Heads')
        rasperry_beret = prince.songs.create!(title: 'Raspberry Beret', length: 234, play_count: 34)
        wild_life = talking_heads.songs.create!(title: 'Wild Wild Life', length: 456, play_count: 45)

        expect(Song.song_count).to eq(2)
      end 
    end 

    describe ".return_in_order" do 
      it "returns all songs listed alphabetically" do 
        prince = Artist.create!(name: 'Prince')
        talking_heads = Artist.create!(name: 'Talking Heads')
        rasperry_beret = prince.songs.create!(title: 'Raspberry Beret', length: 234, play_count: 34)
        wild_life = talking_heads.songs.create!(title: 'Wild Wild Life', length: 456, play_count: 45)

        expect(Song.return_in_order).to eq([rasperry_beret, wild_life])
      end 
    end 

    describe ".return_shortest" do 
      it "returns the shortest x number of songs" do 
        prince = Artist.create!(name: 'Prince')
        rtj = Artist.create!(name: 'Run The Jewels')
        caamp = Artist.create!(name: 'Caamp')

        song1 = prince.songs.create!(title: 'Raspberry Beret', length: 345, play_count: 34)
        song2 = prince.songs.create!(title: 'Purple Rain', length: 524, play_count: 19)
        song3 = rtj.songs.create!(title: 'Legend Has It', length: 2301, play_count: 2300000)
        song4 = rtj.songs.create!(title: 'Talk to Me', length: 2301, play_count: 2300000)
        song5 = caamp.songs.create!(title: '26', length: 940, play_count: 150000)
        song6 = caamp.songs.create!(title: 'Vagabond', length: 240, play_count: 120000)

        expect(Song.return_shortest(3)).to eq([song6, song1, song2])
      end 
    end 

    describe ".get_love_songs" do 
      it "returns a list of songs in alphabetical order that contain the word love in the title" do 
        prince = Artist.create!(name: 'Prince')
        rtj = Artist.create!(name: 'Run The Jewels')
        caamp = Artist.create!(name: 'Caamp')

        song1 = prince.songs.create!(title: 'Raspberry Beret', length: 345, play_count: 34)
        song2 = prince.songs.create!(title: 'Purple Love', length: 524, play_count: 19)
        song3 = rtj.songs.create!(title: 'Legend Has It', length: 2301, play_count: 2300000)
        song4 = rtj.songs.create!(title: 'Talk to Love', length: 2301, play_count: 2300000)
        song5 = caamp.songs.create!(title: '26', length: 940, play_count: 150000)
        song6 = caamp.songs.create!(title: 'Vagabond', length: 240, play_count: 120000)

        expect(Song.get_love_songs).to eq([song2, song4])
      end 
    end 

    describe ".top_three" do 
      it "returns the top 3 most played songs with a length greater than x" do 
        prince = Artist.create!(name: 'Prince')
        rtj = Artist.create!(name: 'Run The Jewels')
        caamp = Artist.create!(name: 'Caamp')

        song1 = prince.songs.create!(title: 'Raspberry Beret', length: 345, play_count: 34)
        song2 = prince.songs.create!(title: 'Purple Love', length: 524, play_count: 19)
        song3 = rtj.songs.create!(title: 'Legend Has It', length: 2301, play_count: 2300000)
        song4 = rtj.songs.create!(title: 'Talk to Love', length: 2301, play_count: 2300001)
        song5 = caamp.songs.create!(title: '26', length: 940, play_count: 150000)
        song6 = caamp.songs.create!(title: 'Vagabond', length: 240, play_count: 120000)

        expect(Song.top_three(400)).to include(song5, song3, song4)
      end 
    end 
  end 

  describe "instance methods" do 
  end 
end 