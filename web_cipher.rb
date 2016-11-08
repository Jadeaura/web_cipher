require 'sinatra'

def caesar_cipher(string, cipher)
  s = string.split(/\s/)
  seed = cipher
  output = ''
  i = 0

  s.each do |word|
    word.scan(/./) do |letter|
      while i < seed
        if letter.ord == 90 || letter.ord == 122
          letter = letter.ord.-(26-seed.to_i).chr
          i += seed.to_i
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
  number = params["number"]
  message = caesar_cipher(text, number)
  erb :index, :locals => {:message => message}
end