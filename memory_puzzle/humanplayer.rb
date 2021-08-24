class HumanPlayer

    def initialize
    end

    def get_position
        p "Enter a position: "
        gets.chomp.split(' ').map {|ele| ele.to_i}
    end

    def recieve_revealed_card(value, position)
    end
end