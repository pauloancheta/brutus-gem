require 'digest'

class Brutus

  def initialize()
  end

  # pass in the key which would be the kind of cipher that the user would input, and match it with the message
  # this will need a loop to match it. it would constantly need to iterate and match it with the current message.
  def decipher(key, digest)
    find_letter_match(key, digest)
  end

  # key - the kind of cipher
  # message - the message to cipher
  def cipher(key, message)
    find_key(key).hexdigest(message)
  end

  private

  def digest_match?(digest, comparer_digest)
    digest == comparer_digest 
  end


  def find_letter_match(key, digest)
    current_letter = "a"
    current_size = current_letter.size
    new_digest = cipher(key, current_letter)
    
    while !digest_match?(digest, new_digest)
      current_letter.next!
      new_digest = cipher(key, current_letter)
      
      if current_size < current_letter.size
        puts current_size
        current_size = current_letter.size
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
    end
  end
end
