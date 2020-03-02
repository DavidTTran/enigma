require_relative 'enigma'
enigma = Enigma.new

ARGV == ["message.txt", "encrypted.txt", "key", "date"]

message = ""
File.foreach(ARGV[0], "r") do |row|
  message << row
end
new_message = enigma.decrypt(message, ARGV[2], ARGV[3])

puts "Created #{ARGV[1]} with the key #{new_message[:key]} and date #{new_message[:date]}."

new_file = File.open(ARGV[1], "w")
new_file.write(new_message[:decryption])
new_file.close
