require_relative 'board.rb'
require_relative 'humanplayer.rb'
require_relative 'computerplayer.rb'
class Game

    def initialize(size = 4)
        @board = Board.new(size)
        @previous_guess = nil
        @gameover = false
        @player = ComputerPlayer.new
    end

    def play
        @board.populate
        while !@gameover
            @board.render
            pos = @player.get_position(@previous_guess)
            self.make_guess(pos)
            self.gameover?
        end
    end


    def make_guess(pos)
        #system("clear")
        if @previous_guess == nil
            @board.reveal(pos)
            @player.recieve_revealed_card(@board[pos].face_value, pos)
            @board.render
            @previous_guess = pos
        else
            @board.reveal(pos)
            @player.recieve_revealed_card(@board[pos].face_value, pos)
            @board.render
            unless @board[pos] == @board[@previous_guess]
                @board[@previous_guess].face = 'down'
                @board[pos].face = 'down'
            end
            @previous_guess = nil
        end
        sleep(3)
    end

    def gameover?
        @gameover = true
        @board.grid.each do |row|
            row.each do |card|
                @gameover = false if card.face == 'down'
            end 
        end
    end




end