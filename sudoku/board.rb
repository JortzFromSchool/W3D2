require_relative "tile.rb"

class Board
    def initialize(grid)
        @grid = grid
    end

    def self.from_file(file)
        grid = Array.new(9){Array.new(9)}
        File.open(file).each.with_index do |line, idx1|
            line.chomp.each_char.with_index do |char, idx2|
                if(char == "0")
                    grid[idx1][idx2] = Tile.new(false, char)
                else
                    grid[idx1][idx2] = Tile.new(true, char)
                end
            end
        end
        return Board.new(grid)
    end

    attr_reader :grid
end