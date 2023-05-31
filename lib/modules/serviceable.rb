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

  def self.root_with_credentials(root, param_title, env_key)
    Faraday.new(root) do |root|
      root.params[param_title] = ENV[env_key]
    end
  end
end