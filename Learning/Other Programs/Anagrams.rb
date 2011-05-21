words = Hash.new([])

File.open("/usr/share/dict/words", "r") do |file|
  while line = file.gets
    word = line.chomp
    words[word.split('').sort!.join('')] += [word]
  end
end

#File.open("word_hash", "w") do |file|
#  Marshal.dump(words, file)
#end
#
#words = nil
#
#File.open("word_hash", "r") do |file|
#  words = Marshal.load(file)
#end

while true
  print "Enter word: "
  anagram = gets.chomp
  exit 0 if anagram == "exit"
  sorted_anagram = anagram.split('').sort!.join('')
  p  words[sorted_anagram]
end
