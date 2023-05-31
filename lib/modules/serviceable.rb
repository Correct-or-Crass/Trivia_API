module Serviceable
  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn(root)
    Faraday.new(root)
  end

  def self.phrases_words_connection
    Faraday.new("https://shielded-headland-00998.herokuapp.com")
  end
end