class WordSerializer
  include JSONAPI::Serializer
    attributes :id, :type, :word
  
end