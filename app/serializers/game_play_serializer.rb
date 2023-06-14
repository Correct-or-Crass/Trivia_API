class GamePlaySerializer

  def self.play_response(photo,answer,words)
    {
     "data": {
            "attributes": {
              "photo": photo,
              "answer": answer,
              "choices": words
            }
     }
    }
  end
end