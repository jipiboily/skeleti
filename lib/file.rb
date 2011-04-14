def mkdir name
  d = Dir::pwd + "/Resources/" + name
    if FileTest::directory?(d)
      return
    end
  Dir::mkdir(d)
end

def create_file file, content
  write_to_file file, content, 'w'
end

def append_to_file file, content
  write_to_file file, content, 'a'
end

def write_to_file file, content, mode
  File.open("Resources/" + file, mode) {|f| f.write(content) }
end