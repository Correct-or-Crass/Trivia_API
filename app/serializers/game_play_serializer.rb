class GamePlaySerializer

  def self.play_response(photo,answer)
    {
     "data": {
            type: "game_play",
            "attributes": {
              "photo": photo,
              "answer": answer["answer"],
              "choices": answer["choices"]
            }
     }
    }
  end
end