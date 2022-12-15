class Game
  attr_reader :active_player

  def initialize
    @active_player = nil
    @players = []
  end

  def start_game
    puts "Welcome to the math game!"

    player1 = Players.new("Player 1")
    @players << player1

    player2 = Players.new("Player 2")
    @players << player2

    @active_player = @players[1]


    while (@active_player.lives > 0)
      run_round
    end

    end_game
  end

 def switch_player
    if (@active_player == @players[0])
      @active_player = @players[1]
    else
      @active_player = @players[0]
    end

  end

  def end_game 
    switch_player
    puts "----- GAME OVER -----"
    puts "#{active_player.name} wins with score of #{@active_player.lives}/3"
  end

  def run_round
    puts "---- NEW TURN -----"
    switch_player
    question = Questions.new
    puts "#{@active_player.name}: #{question.display_question}"
    answer = gets.chomp.to_i
  
    if question.correct?(answer)
      puts "correct!"
    else 
      puts "wrong! lose a life fool"
      @active_player.lose_life
    end

    puts "P1: #{@players[0].lives}/3 vs P2: #{@players[1].lives}/3"

  end
end