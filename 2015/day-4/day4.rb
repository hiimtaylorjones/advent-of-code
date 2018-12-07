require 'digest'

def mine_5(str)
  looking = true
  start = 0
  while(looking == true)

    new_str = str + start.to_s
    md5_str = Digest::MD5.hexdigest new_str

    if md5_str[0..4] == "00000"
      looking = false
    else
      start += 1
      puts "start: " + start.to_s
    end
  end

  return md5_str
end

def mine_5(str)
  looking = true
  start = 0
  while(looking == true)

    new_str = str + start.to_s
    md5_str = Digest::MD5.hexdigest new_str

    if md5_str[0..5] == "000000"
      looking = false
    else
      start += 1
      puts "start: " + start.to_s
    end
  end

  return md5_str
end

puts mine_5("yzbqklnj")
puts mine_6
