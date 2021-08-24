class ComputerPlayer
    def initialize
        @known_cards = Hash.new {|h, k| h[k] = []}
        @matched_cards = Hash.new { |h, k| h[k] = []}
        @current_pair = nil
        @matched_keys = []
    end

    def recieve_revealed_card(key, value)
        if !@known_cards[key].include?(value)
            @known_cards[key] << value
        end
        @known_cards.each_key do |key|
            if @known_cards[key].length == 2
                print @known_cards[key]
                recieve_match(key, @known_cards[key][0], @known_cards[key][1])
            end
        end
    end

    def recieve_match(key, pos1, pos2)
        @matched_cards[key] << pos1
        @matched_cards[key] << pos2
    end

    def get_position(previous_guess)
        if previous_guess == nil
            if @matched_cards.length > 0
                puts "case 1: matched cards detected"
                match = @matched_cards.keys
                i = 0
                while @matched_keys.include?(match[i])
                    i += 1
                end
                pair_value = match[i]
                @current_pair = pair_value
                return @matched_cards[pair_value][0]
            else
                puts "case 2: first guess no matched cards detected"
                return self.get_new_position
            end
        else
            if @current_pair != nil
                puts "case 3: guessing second matched card"
                @matched_keys << pair_value
                return @matched_cards[pair_value][1]
            else
                puts "case 4: second random guess"
                return self.get_new_position
            end
        end
    end

    def get_new_position
        row = rand(0...4)
        col = rand(0...4)
        while @known_cards.has_value?([row, col])
            row = rand(0...4)
            col = rand(0...4)
        end
        return [row, col]
    end
end