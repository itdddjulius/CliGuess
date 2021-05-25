#ruby
#!/usr/bin/env ruby
require 'optparse'


class CliGuess


#===============================================================================
#= NAUGHTS AND CROSSES
#===============================================================================
  # BEG DEF ==============================================================================
  # BEG DEF display_oxboard - display current OXBOARD state ==============================
  # BEG DEF ==============================================================================
  def self.display_oxboard(bd)
    if bd
      puts " #{bd[0]} | #{bd[1]} | #{bd[2]} "
      puts separator = "-----------"
      puts " #{bd[3]} | #{bd[4]} | #{bd[5]} "
      puts separator
      puts " #{bd[6]} | #{bd[7]} | #{bd[8]} "
      puts "  "
      puts "  "
    else
      puts "OXWARN(001):The BOARD must exist prior to display"
    end

    return bd
  end
  # END DEF ==============================================================================


  # BEG DEF ==============================================================================
  # BEG DEFchk_oxwin - DETERMINE if OXBOARD in WIN STATE =================================
  # BEG DEF ==============================================================================
  def self.chk_oxwin( bd )

  end
  # END DEF ==============================================================================



  # BEG DEF ==============================================================================
  # BEG DEF get_oxcomp - EVALUTE COMPUTER move oxcomp ====================================
  # BEG DEF ==============================================================================
  def self.get_oxcomp( bd, oxcomp )
    ox1=bd[0]+bd[1]+bd[2]
    ox2=bd[3]+bd[4]+bd[5]
    ox3=bd[6]+bd[7]+bd[8]
    ox4=bd[0]+bd[3]+bd[6]
    ox5=bd[1]+bd[4]+bd[7]
    ox6=bd[2]+bd[5]+bd[8]
    ox7=bd[0]+bd[4]+bd[8]
    ox8=bd[2]+bd[4]+bd[6]


    case  ox1+ox2+ox3
      when "..."+".O."+"..."
        oxcomp = 0
      when "X.."+"..O"+"..O"
        oxcomp = 2
      when "X.."+"..O"+".O."
        oxcomp = 4
      when "X.."+"..O"+"O.."
        oxcomp = 4

      when "X.."+".O."+".O."
        oxcomp = 1


      when "X.."+"O.."+"O.."
        oxcomp = 4
      when "X.."+".O."+"..O"
        oxcomp = 2
      when "X.."+".O."+"O.."
        oxcomp = 2
      when "X.."+".OO"+"..."
        oxcomp = 3
      when "X.."+"OO."+"..."
        oxcomp = 5
      when "X.."+"O.O"+"..."
        oxcomp = 4
      when "X.."+"..."+".OO"
        oxcomp = 6
      when "X.."+"..."+"OO."
        oxcomp = 8
      when "X.."+"..."+"O.O"
        oxcomp = 7
      else
        oxcomp = 5
    end

    oxcomp = oxcomp + 1 #Ensure we INCREASE COMPUTER MOVE OXCOMP by 1 since BOARD=[0,8]

    puts "I Shall Move to <#{oxcomp}>"

    oxcomp = oxcomp - 1 #Ensure we DECREASE HUMAN MOVE OXMOVE by 1 since BOARD=[0,8]

    bd[ oxcomp ] = "X"
    bd = display_oxboard( bd )
    return bd
  end
  # END DEF ==============================================================================



  # BEG DEF ==============================================================================
  # BEG DEF ox - Play NAUGHTS & CROSSES --- HUMAN vs COMPUTER ============================
  # BEG DEF ==============================================================================
  def self.ox
      empty_board = display_oxboard(".........")
      board = empty_board

      first_move = get_oxmove( board, "" ) #Logically we MUST OBTAIN AT LEATS (1) MOVE
      human_move = first_move + 1 #Ensure we INCREASE COMPUTER MOVE OXCOMP by 1 since BOARD=[0,8]
      comp_move = -1
      print "OK, you moved<#{human_move}> ...... "
      board = get_oxcomp( board, comp_move )

      #NOW each subsequent move by HUMAN stored in HUMAN_MOVE
      while board == empty_board
        case human_move = get_oxmove( board, "" )
          when 1..9
            human_move = human_move + 1 #Ensure we INCREASE COMPUTER MOVE OXCOMP by 1 since BOARD=[0,8]
            print "OK, you moved<#{human_move}> ...... "
            board = get_oxcomp( board, comp_move )
          else
        end #END - CASE ==================================================
      end #END - WHILE ===================================================
  end
  # END DEF ==============================================================================


  def self.run_ox( bd, str)
  end


  # BEG DEF ==============================================================================
  # BEG DEF get_oxmove - Obtain HUMANS move either via --name [VAR] or input =============
  # BEG DEF ==============================================================================
  def self.get_oxmove( bd, str )
    options = {}
    OptionParser.new do |parser|
      parser.on("-n", "--names NAME", "The name of the person") do |value|
        options[:name] = value
      end
    end.parse!

    #bd = display_oxboard( bd )

    if options[:name]
      str = options[:name]  # J.O. - Sneaky assign str = --namne variable
      oxmove = str.to_s.downcase.gsub(/[^0-9]/i, '').to_i
      #puts "str=<#{str}> oxmove=#{oxmove}"
      puts "Your Move=#{oxmove}"
    else

      puts "Please Enter Your Move-{1 - 9}"
      oxmove = "~"
      while oxmove == "~" do
        oxmove = gets
        oxmove = oxmove.to_s.downcase.gsub(/[^1-9]/i, '').to_i
        case oxmove
        when 1..9
            puts "Thank You - Your Move=<#{oxmove}>"
          else
            puts "OXWARN(002):<#{oxmove}> Please Enter Your Move-{1 - 9}"
            oxmove = "~"
        end
      end
    end

    oxmove = oxmove-1 #Ensure we DECREASE HUMAN MOVE OXMOVE by 1 since BOARD=[0,8]

    bd[ oxmove ]="O"
    bd = display_oxboard( bd )
    return oxmove
  end
  # END DEF ==============================================================================



#===============================================================================
#= END of NAUGHTS AND CROSSES
#===============================================================================





#===============================================================================
#= PALINDROME CHECKER
#===============================================================================
  def self.chk_pal( str )
    options = {}
    OptionParser.new do |parser|
      parser.on("-n", "--names NAME", "The name of the person") do |value|
        options[:name] = value
      end
    end.parse!

    if options[:name]
      str = options[:name]  # J.O. - Sneaky assign str = --namne variable
    end

    case str[0]
    when '~'
      #puts "chk_pal( str ) - options[:name]=<" + options[:name] + ">"
      #puts "chk_pal( str ) - str=<" + str + ">"
      make_guess( str )
    when '@'
      get_oxmove( str )
    else
      do_chk_pal( str )
    end
  end


  def self.do_chk_pal( str )
    if is_pal( str )
       puts "<" + str + "> is a PALENDROME"
    else
       puts "<" + str + "> is NOT a PALENDROME"
    end
  end

  # BEG DEF ==============================================================================
  # BEG DEF is_pal - Boolean, chk if str is PALENDROME ( e.g. ROBERTTREBOR ) =============
  # BEG DEF ==============================================================================
  def self.is_pal( str )
    if str
      raise unless str.to_s.is_a?(String) #J.O. Checky will allways be (.to_s) unless NULL
      str2 = str.to_s.downcase.gsub(/[^0-9a-z]/i, '')
      str2.reverse == str2
    else
      FALSE
    end
  end
  # END DEF ==============================================================================

#===============================================================================
#= END of PALINDROME CHECKER
#===============================================================================



#===============================================================================
#= GUESS RANDOM NUMBER
#===============================================================================
  # BEG DEF ==============================================================================
  # BEG DEF make_cls - Clear Screen ======================================================
  # BEG DEF ==============================================================================
  def self.make_cls
    system "clear"
    system "cls"
  end
  # END DEF ==============================================================================


  # BEG DEF ==============================================================================
  # BEG DEF make_intro - Calling --name flag prompts Introduction ========================
  # BEG DEF ==============================================================================
  def self.make_intro( name )
    raise unless name.to_s.is_a?(String)

    make_cls

    if name #options[:name]
      puts 'hello ' + name #options[:name]
    else
      puts 'hello stranger'
    end
  end
  # END DEF ==============================================================================



  # BEG DEF ==============================================================================
  # BEG DEF make_guess - While-Do Random Num Guessing loop { With option to repeat =======}
  # BEG DEF ==============================================================================
  def self.make_guess( name )
    raise unless name.is_a?(String)

    options = {}
    OptionParser.new do |parser|
      parser.on("-n", "--names NAME", "The name of the person") do |value|
        options[:name] = value
      end
    end.parse!

    if options[:name]
      name = options[:name]  # J.O. - Sneaky assign namne = --namne variable
      #puts "make_guess( name ) - options[:name]=<" + options[:name] + ">"
    end

    #puts "make_guess( name ) - str=<" + name + ">"

    make_intro( name )

    guess = rand(2000) + 1
    puts "OK (I have a Random Number between {1 & 2000} <#{guess}>, Please try and Guess...)"
    input = gets

    while input.strip != 'x' do
      case input.strip
      when 'c' || 'C'
        make_cls
      when 'x' || 'X'
        puts 'Exiting....'
      else
        if input.strip.to_i == guess
          puts "SUCCESS - YES"
          puts "again (y/n)"
          input = gets
          if input.strip == 'y' || input.strip == 'Y'
            guess = rand(2000) + 1
            puts "OK (I have another Random Number between {1 & 2000} <#{guess.to_s}>, Please try and Guess...)"
            input = gets
          else
            input = 'x'
          end
        elsif input.strip.to_i > guess
          puts '(' + input.strip + ')...>>>'
          input = gets
        elsif input.strip.to_i < guess
          puts  '(' + input.strip + ')...<<<'
          input = gets
        #else
        #    puts 'OK..(' + input.strip + ')'
        #    input = gets
        end
      end
    end
    puts 'Exiting....'
  end
  # END DEF ==============================================================================

#===============================================================================
#= END of GUESS RANDOM NUMBER
#===============================================================================

end


# GUESS RANDOM NUMBER == CliGuess.make_guess( "Simple" )
# PALINDROME CHECKER CliGuess.is_pal( "BPP" )
# PALINDROME CHECKER == CliGuess.chk_pal( "BPP" )

#OX
#CliGuess.display_oxboard( "........." )
#CliGuess.get_oxmove( ".........", 5 )
CliGuess.ox
