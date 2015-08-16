require 'digest'

class Brutus

  def self.decipher_letters(key, digest)
    find_letter_match(key, digest)
  end

  def self.decipher_numbers(key, digest)
    find_number_match(key, digest)
  end

  def self.cipher(key, message)
    find_key(key).hexdigest(message)
  end

  private

  def self.digest_match?(digest, comparer_digest)
    digest == comparer_digest 
  end 

  def self.find_number_match(key, digest)
    current_number = 0
    new_digest = cipher(key, current_number.to_s)
    current_thousands = 1000
    puts "currently searching through #{current_number % 1000} to #{current_thousands}"

    while !digest_match?(digest, new_digest)
      current_number += 1
      new_digest = cipher(key, current_number.to_s)

      if current_number == current_thousands
        puts "currently searching through #{current_number % 1000} to #{current_thousands}"
        current_thousands += 1000
      end
    end
    puts "THE PASSWORD IS #{current_number}"
  end

  def self.find_letter_match(key, digest)
    current_letter = "a"
    current_size = current_letter.size
    new_digest = cipher(key, current_letter)
    
    while !digest_match?(digest, new_digest)
      current_letter.next!
      new_digest = cipher(key, current_letter)
      
      if current_size < current_letter.size
        current_size = current_letter.size
        puts "currently search through #{current_size} letters"
      end
    end

    puts "THE PASSWORD IS: #{current_letter}"
  end

  def self.find_key(key)
    case key
    when 'md5'
      Digest::MD5.new
    when 'sha256'
      Digest::SHA256.new
    end
  end
end
