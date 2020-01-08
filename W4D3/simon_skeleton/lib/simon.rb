class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    while !game_over
      self.take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    self.show_sequence
    self.require_sequence
    self.round_success_message
    self.sequence_length += 1
  end

  def show_sequence
    add_random_color
    seq
  end

  def require_sequence
    
  end

  def add_random_color
    colors = ["red", "blue", "yellow", "green"]
    rand_ind = rand(0...colors.length)
    seq << colors[rand_ind]
  end

  def round_success_message

  end

  def game_over_message

  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end
