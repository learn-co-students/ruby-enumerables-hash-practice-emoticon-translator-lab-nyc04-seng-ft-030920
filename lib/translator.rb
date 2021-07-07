require "yaml"

def load_library(file)
  emo = YAML.load_file(file)
  translator ={}
  eng = 0
  jap = 1
  translator["get_meaning"] = {}
  emo.each_pair do |meaning, emoticon|
    translator["get_meaning"][emoticon[jap]] = meaning
  end
  translator["get_emoticon"] = {}
  emo.each_pair do |meaning, emoticon|
    translator["get_emoticon"][emoticon[eng]] = emoticon[jap]
  end
  translator
end

def get_japanese_emoticon(file, emoticon)
  translator = load_library(file)["get_emoticon"]
  translator[emoticon] ? translator[emoticon] : "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emoticon)
  translator = load_library(file)["get_meaning"]
  translator[emoticon] ? translator[emoticon] : "Sorry, that emoticon was not found"
end