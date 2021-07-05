require "yaml"

def load_library(yaml_file)
  response = {"get_meaning" => {}, "get_emoticon" => {}}
  library = YAML.load_file(yaml_file)
  library.each do |trans, emoj|
  response["get_meaning"][emoj[1]] = trans
  response["get_emoticon"][emoj[0]] = emoj[1]
  end
  response
end

 
def get_japanese_emoticon(file_path = './lib/emoticons.yml', english_emoticon)
  library = load_library(file_path)
  if library["get_emoticon"].include?(english_emoticon) 
    library["get_emoticon"][english_emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end


def get_english_meaning(file_path = './lib/emoticons.yml',japanese_emoticon)
    library = load_library(file_path)
    if library["get_meaning"].include?(japanese_emoticon) 
          library["get_meaning"][japanese_emoticon]
    else
        "Sorry, that emoticon was not found"
    end
end
    