require "player"

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = Player.new(name1)
    @name2 = Player.new(name2)
    @cups = Array.new(14) {Array.new(4, :stone)}
    @cups[6], @cups[13] = [], []
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if !start_pos.between?(0,13)
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    cant_side = start_pos.between?(0, 6) ? 13 : 6
    num_stones = @cups[start_pos].length
    @cups[start_pos] = []
    i = 1
    while i <= num_stones
      pos = (start_pos + i) % 14
      if pos != cant_side
        @cups[pos] << :stone
      else
        @cup[(pos + 1) % 14] << :stone # skip opponent's score
      end
      i += 1
    end
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
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
