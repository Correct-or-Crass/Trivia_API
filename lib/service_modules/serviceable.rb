module ServiceModules
  module Serviceable
    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def phrases_words_connection
      Faraday.new("https://shielded-headland-00998.herokuapp.com")
    end

    def root_with_credentials(domain_name, param_title, env_key)
      Faraday.new(domain_name) do |query|
        query.params[param_title] = ENV[env_key]
      end
    end
  end 
end