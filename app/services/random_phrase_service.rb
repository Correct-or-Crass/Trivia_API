require "./lib/service_modules/serviceable.rb"

class RandomPhraseService 
    extend ServiceModules::Serviceable
     
    def self.generate_phrase(type)
        response = phrases_words_connection.get("api/v1/#{type}")
        parse_json(response) 
    end
end 