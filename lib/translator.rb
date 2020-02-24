require 'yaml'
require 'pry'

def load_library(file_path)
  library = YAML.load_file(file_path)
  result = {"get_meaning" => {}, "get_emoticon" => {} }
  library.each do |meaning, emoticons|
    result["get_meaning"][emoticons[1]] = meaning
    result["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  result
end

def get_japanese_emoticon(file_path, emoticon)
  find = load_library(file_path)["get_emoticon"][emoticon]
  find ? find : "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  find = load_library(file_path)["get_meaning"][emoticon]
  find ? find : "Sorry, that emoticon was not found"
end