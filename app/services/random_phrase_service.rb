require "./lib/modules/serviceable.rb"

class RandomPhraseService
    def self.generate_phrase(type)
        response = Serviceable.phrases_words_connection.get("api/v1/#{type}")
        Serviceable.parse_json(response) 
    end
end