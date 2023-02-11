require "rails_helper"

RSpec.describe Artist, type: :model do 
  describe "validations" do 
    it { should validate_presence_of :name}
  end 

  describe "relationships" do 
    it { should have_many :songs }
  end 

  describe "instance methods" do
    describe "#average_song_length" do 
      it "returns the average song length for a particular artist" do 
        talking_heads = Artist.create!(name: 'Talking Heads')
        she_was = talking_heads.songs.create!(title: 'And She Was', length: 234, play_count: 34)
        wild_life = talking_heads.songs.create!(title: 'Wild Wild Life', length: 456, play_count: 45)
  
        expect(talking_heads.average_song_length).to eq(345)
      end 
    end 

    describe "#return_in_order" do 
      it "returns an artists songs in alphabetical order" do 
        talking_heads = Artist.create!(name: 'Talking Heads')
        she_was = talking_heads.songs.create!(title: 'And She Was', length: 234, play_count: 34)
        wild_life = talking_heads.songs.create!(title: 'Wild Wild Life', length: 456, play_count: 45)
        
        expect(talking_heads.return_in_order).to eq([she_was, wild_life])
      end 
    end 

    describe "#get_shortest" do 
      it "returns the x shortest songs for an artist" do 
        prince = Artist.create!(name: 'Prince')

        song1 = prince.songs.create!(title: 'Raspberry Beret', length: 345, play_count: 34)
        song2 = prince.songs.create!(title: 'Purple Rain', length: 524, play_count: 19)
        song5 = prince.songs.create!(title: '26', length: 940, play_count: 150000)
        song6 = prince.songs.create!(title: 'Vagabond', length: 240, play_count: 120000)

        expect(prince.get_shortest(2)).to eq([song6, song1])
      end 
    end  

    describe "#get_played_songs" do 
      it "returns songs where the play count > 1 and length > 0" do 
        prince = Artist.create!(name: 'Prince')

        song1 = prince.songs.create!(title: 'Raspberry Beret', length: 345, play_count: 0)
        song2 = prince.songs.create!(title: 'Purple Rain', length: 524, play_count: 19)
        song5 = prince.songs.create!(title: '26', length: 940, play_count: 150000)
        song6 = prince.songs.create!(title: 'Vagabond', length: 0, play_count: 120000)

        expect(prince.get_played_songs).to eq([song5, song2])
      end 
    end 
  end 
end 