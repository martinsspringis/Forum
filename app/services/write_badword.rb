class WriteBadword
  def initialize(word)
  	@word = word
  end

  def write
    fout = File.open('badwords.txt', 'a')
    fout.write("#{@word} ")
    fout.close
  end
end