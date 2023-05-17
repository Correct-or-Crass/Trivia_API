class WordSerializer
  include JSON::Serializer
    attributes :id, :type, :word
  
end