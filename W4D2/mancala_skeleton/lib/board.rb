require "player"

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    new_arr = Array.new(14) {Array.new(4, :stone)}
    new_arr[6], new_arr[13] = [], []
    new_arr
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if !start_pos.between?(0,13)
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    curr_player = @player1 == current_player_name ? @player1 : @player2 
    cant_side = curr_player == @player1 ? 13 : 6 # player cannot put it in other person's score
    score_side = curr_player == @player1 ? 6 : 13
    num_stones = @cups[start_pos].length
    @cups[start_pos] = []
    i = 1
    count = 0
    while count < num_stones
      pos = (start_pos + i) % 14
      if pos != cant_side
        @cups[pos] << :stone # add stone to position
        count += 1
      end
      i += 1
    end
    render
    next_turn(pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    # if it's an empty cup, switch
    if @cups[ending_cup_idx].length == 1
      return :switch
    else
      return :prompt
    end 
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
