CHOICES = %w(r p s)

class Player
  attr_reader :player_type

  def initialize(player_type)
    @player_type = player_type
  end

  def move
    case player_type
    when "human"
      answer = nil
      loop do
        puts "Choose between rock, paper, scissors."
        answer = gets.chomp
        break if %w(r p s).include?(answer)
        "Invalid choice"
      end
      puts "#{self} chose #{answer}"
      answer
    when "computer"
      comp_choice = CHOICES.sample
      puts "#{self} chose #{comp_choice}"
      comp_choice
    end
  end

  def to_s
    player_type
  end
end

class Game
  attr_reader :human, :computer, :human_choice, :computer_choice

  def initialize
    @human = Player.new("human")
    @computer = Player.new("computer")
  end

  def welcome_message
    puts "Welcome to Rock Paper Scisors."
  end

  def goodbye_message
    puts "Thanks for playing."
  end

  def detect_winner
    if human_choice == computer_choice
      puts "It's a tie."
    elsif (human_choice == 'r' && computer_choice == 's') ||
          (human_choice == 'p' && computer_choice == 'r') ||
          (human_choice == 's' && computer_choice == 'p')
      puts "Player wins"
    else
      puts "Computer wins"
    end
  end

  def play
    welcome_message
    @human_choice = human.move
    @computer_choice = computer.move
    detect_winner
    goodbye_message
  end
end

game = Game.new
game.play
