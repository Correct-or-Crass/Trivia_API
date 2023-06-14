class GamePlaySerializer
  # include JSONAPI::Serializer
  # attributes  :photo,
  #             :answer,
  #             :choices
 "data" {
        "attributes" {
          "photo": @photo,
          "answer": @answers[0],
          "choices": @answers
        }
 }
end