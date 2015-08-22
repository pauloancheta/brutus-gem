require 'digest'

class Brutus

  def initialize(key= "md5", message)
    @key = key
    @message = message
  end

  def decode_letters(key= @key)
    find_letter_match(key, @message)
  end

  def decode_numbers(key= @key)
    find_number_match(key, @message)
  end

  def encode(key= @key, message=@message)
    find_key(key).hexdigest(message)
  end

  private

  def digest_match?(digest, comparer_digest)
    digest == comparer_digest 
  end 

  def find_number_match(key, digest)
    current_number = 0
    new_digest = encode(keys)
    current_thousands = 1000
    puts "currently searching through #{current_number % 1000} to #{current_thousands}"

    while !digest_match?(digest, new_digest)
      current_number += 1
      new_digest = encode(key, current_number.to_s)

      if current_number == current_thousands
        puts "currently searching through #{current_number % 1000} to #{current_thousands}"
        current_thousands += 1000
      end
    end
    current_number
  end

  def find_letter_match(key, digest)
    current_letter = "a"
    current_size = current_letter.size
    new_digest = encode(key, digest)
    
    while !digest_match?(digest, current_letter)
      current_letter.next!
      new_digest = encode(key, current_letter)
      
      if current_size < current_letter.size
        current_size = current_letter.size
        puts "currently search through #{current_size} letters"
      end
    end
    current_letter
  end

  def find_key(key)
    case key
    when 'md5'
      Digest::MD5.new
    when 'sha256'
      Digest::SHA256.new
    when 'sha1'
      Digest::SHA1.new
    when 'sha2'
      Digest::SHA2.new
    when 'rmd160'
      Digest::RMD160.new
    end
  end
end
