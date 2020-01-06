require('spec_helper')

describe '#Song' do
  describe('#==') do
    it("is the same song if it has the same attributes as another song") do
      album = Album.new({:name => "A Love Supreme", :id => nil})
      album.save()
      song = Song.new({:name => "Naima", :album_id => album.id, :id => nil})
      song2 = Song.new({:name => "Naima", :album_id => album.id, :id => nil})
      expect(song).to(eq(song2))
    end
  end

  describe('.all') do
    it("returns a list of all songs") do
      album = Album.new({:name => "A Love Supreme", :id => nil})
      album.save()
      song = Song.new({:name => "Naima", :album_id => album.id, :id => nil})
      song.save()
      song2 = Song.new({:name => "Blue", :album_id => album.id, :id => nil})
      song2.save()
      expect(Song.all).to(eq([song, song2]))
    end
  end

  describe('.clear') do
    it("clears all songs") do
      album = Album.new({:name => "A Love Supreme", :id => nil})
      album.save()
      song = Song.new({:name => "Naima", :album_id => album.id, :id => nil})
      song.save()
      song2 = Song.new({:name => "Blue", :album_id => album.id, :id => nil})
      song2.save()
      Song.clear()
      expect(Song.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a song") do
      album = Album.new({:name => "A Love Supreme", :id => nil})
      album.save()
      song = Song.new({:name => "Naima", :album_id => album.id, :id => nil})
      song.save()
      expect(Song.all).to(eq([song]))
    end
  end

  describe('.find') do
    it("finds a song by id") do
      album = Album.new({:name => "A Love Supreme", :id => nil})
      album.save()
      song = Song.new({:name => "Naima", :album_id => album.id, :id => nil})
      song.save()
      song2 = Song.new({:name => "Blue", :album_id => album.id, :id => nil})
      song2.save()
      expect(Song.find(song.id)).to(eq(song))
    end
  end
#
  describe('#update') do
    it("updates a song by id") do
      album = Album.new({:name => "A Love Supreme", :id => nil})
      album.save()
      song = Song.new({:name => "Naima", :album_id => album.id, :id => nil})
      song.save()
      song.update("Mr. P.C.", album.id)
      expect(song.name).to(eq("Mr. P.C."))
    end
  end

describe('#delete') do
  it("deletes all songs belonging to a deleted album") do
    album = Album.new({:name => "A Love Supreme", :id => nil})
    album.save()
    song = Song.new({:name => "Naima", :album_id => album.id, :id => nil})
    song.save()
    album.delete()
    expect(Song.find(song.id)).to(eq(nil))
  end
end

  describe('.find_by_album') do         #test to find songs for album
    it("finds songs for an album") do
      album = Album.new({:name => "A Love Supreme", :id => nil})
      album.save
      song = Song.new({:name => "Naima", :album_id => album.id, :id => nil})
      song.save()
      song2 = Song.new({:name => "Blue", :album_id => album.id, :id => nil})
      song2.save()
      expect(Song.find_by_album(album.id)).to(eq([song, song2]))
    end
  end

  describe('#album') do         #find album that songs belong to
    it("finds the album a song belongs to") do
      album = Album.new({:name => "A Love Supreme", :id => nil})
      album.save
      song = Song.new({:name => "Naima", :album_id => album.id, :id => nil})
      song.save()
      expect(song.album()).to(eq(album))
    end
  end
end
