class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until game_over == true
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message
    add_random_color
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep 0.75
      system("clear")
      sleep 0.25
    end
  end

  def require_sequence
    puts "Enter the first letter of each color."
    @seq.each do |color|
      user_color = gets.chomp
      if color[0] != user_color
        @game_over = true
        break
      end
    end
    sleep 0.25
  end

  def add_random_color
    seq << COLORS.shuffle.first
  end

  def round_success_message
    "Lucky Guess, here is the next sequence:"
  end

  def game_over_message
    "Game Over"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end
