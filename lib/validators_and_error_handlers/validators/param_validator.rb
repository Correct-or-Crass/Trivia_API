module ValidatorsAndErrorHandlers
  module Validators
    module ParamValidator

      def self.convert_valid_param_to_integers(params)
        if param_is_number?(params).is_a?(ArgumentError)
          return param_is_number?(params).exception
        else
          wins   = params[:wins]   ?  params[:wins].to_i : 0 
          rounds = params[:rounds] ?  params[:rounds].to_i : 5 
        end

        evaluate_wins_to_rounds(wins, rounds) if wins.present?
      end  

      def self.param_is_number?(params)
        begin
          Integer(params[:wins]) &&  Integer(params[:wins])
          return true
        rescue => error
          return error
        end
      end

      def self.evaluate_wins_to_rounds(wins, rounds)
        if wins > rounds
          return "Wins must be less than or equal to Rounds"
        else
          return [wins, rounds]
        end        
      end
    end 
  end
end