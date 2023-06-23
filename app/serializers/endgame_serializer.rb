class EndgameSerializer
  def self.json_response(data)
    {
     data: {
            type: "endgame",
            attributes: {
                        phrase: data[:phrase],
                        gif: data[:gif],
                       }
            }
    }
  end
end