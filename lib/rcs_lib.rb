class RCSLib
  
  def self.random_alphanumeric_string(len, prefix='')
    (0...len).map { ('a'..'z').to_a[rand(26)] }.join
  end
  
  def self.random_string(len, prefix='')
    s = SecureRandom.base64 len
    s.gsub!(/\W/, 'x')
    prefix + s
  end
  
end