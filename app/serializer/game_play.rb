class GamePlaySerializer
include JSON::Serializer
  attributes :photo, :correct_answer, :choices
end