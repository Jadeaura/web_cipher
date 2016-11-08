require 'sinatra'

def caesar_cipher(string, cipher)
  s = string.split(/\s/)
  seed = cipher
  output = ''
  i = 0

  s.each do |word|
    word.scan(/./) do |letter|
      while i < seed
        if letter.ord == 90
          letter = 65.chr
          i += 1
        elsif letter.ord == 122
          letter = 97.chr
          i += 1
        else
          letter = letter.next
          i += 1
        end
      end
      output << letter
      i = 0
    end
    output += ' '
  end
  p output.chomp(' ')
end

get '/' do
  text = params["text"]
  number = params["number"].to_i
  message = "You haven't scrambled any text yet!"
  if text != nil && number != nil
    message = caesar_cipher(text, number)
  end
  erb :index, :locals => {:message => message}
end