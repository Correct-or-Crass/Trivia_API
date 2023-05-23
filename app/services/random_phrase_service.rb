class RandomPhraseService 
    def self.generate_phrase(type)
        response = conn.get("api/v1/#{type}")
        parse_json(response)
    end

    def self.conn 
        Faraday.new('https://shielded-headland-00998.herokuapp.com')
    end

    def self.parse_json(response)
        JSON.parse(response.body, symbolize_names: true)
    end
end