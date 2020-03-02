require_relative 'cipher'
require_relative 'enigma'
enigma = Enigma.new
cipher = Cipher.new

ARGV == ["message.txt", "encrypted.txt"]
ARGV[0] == "message.txt"
ARGV[1] == "encrypted.txt"

message = ""
file = File.foreach(ARGV[0], "r") do |row|
  message << row
end

new_message = enigma.encrypt(message)

puts "Created #{ARGV[1]} with the key #{new_message[:key]} and date #{new_message[:date]}."

new_file = File.open(ARGV[1], "w")
new_file.write(new_message[:encryption])
new_file.close
