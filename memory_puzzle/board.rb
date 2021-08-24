require_relative "card.rb"

class Board

    attr_reader :grid
    def initialize(size = 4)
        @size = size
        @grid = Array.new(size){Array.new(size)}
    end

    def populate
        pairs = @size * @size / 2
        letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        i = 0
        while i < pairs
            self.add_card(Card.new(letters[i]))
            self.add_card(Card.new(letters[i]))
            i += 1
        end
    end

    def add_card(card)
        unless self.full?
            success = false
            while !success
                row = rand(0...@size)
                col = rand(0...@size)
                if @grid[row][col] == nil
                    @grid[row][col] = card
                    success = true
                end
            end
        end
    end

    def full?
        @grid.each do |elem|
            return false if elem.any?(nil)
        end
        return true
    end

    def render
        #topline
        print " "
        (0...@size).each do |num|
            print "#{num} "
        end

        #rows
        print "\n"
        (0...@size).each do |num|
            print "#{num} "
            @grid[num].each do |card|
                print card.display + " "
            end
            print "\n"
        end
        print "\n"
    end

    def won?
        @grid.each do |row|
            row.each do |card|
                return false if card.face == "down"
            end
        end
        return true
    end
end