# frozen_string_literal: true

module Types
  class GameplayType < Types::BaseObject
    def game_play
      require 'pry'; binding.pry
      word_count = 4
      words_and_picture = GameplayFacade.get_words_answer_pics(word_count)
    end
  end
end
