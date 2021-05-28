#ruby
#!/usr/bin/env ruby
require 'optparse'


class CliGuess


  def self._oxaudit(str1, str2, on)
    if on
      puts "OXAUDIT - #{str1.upcase.to_s} - #{str2.upcase.to_s}"
    end
  end

#===============================================================================
#= NAUGHTS AND CROSSES
#===============================================================================
  # BEG DEF ==============================================================================
  # BEG DEF display_oxboard - display current OXBOARD state ==============================
  # BEG DEF ==============================================================================
  def self.display_oxboard(bd)
    _oxaudit("ENTER","display_oxboard(bd)",0)
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

    _oxaudit("EXIT","display_oxboard(bd)",0)

    return bd
  end
  # END DEF ==============================================================================




  # BEG DEF ==============================================================================
  # BEG DEF run_ox( str ) ==> AUDIT OFF ==================================================
  # BEG DEF ==============================================================================
  def self.run_ox( str )
    _oxaudit("ENTER","run_ox",0)

    puts ""
    print "Would You Like to Play Again...(Y/N)"
    case input = gets.upcase.gsub(/[^A-Z]/i, '').to_s
      when "Y"
        puts "OK....."
        ox
      else
        puts "Goodbye...."
        puts 'Exiting....'
    end

    _oxaudit("EXIT","run_ox",0)
  end
  # END DEF ==============================================================================



  def self.comp_win
    _oxaudit("ENTER","comp_win",0)

    puts "=============================="
    puts "====>{([As USUAL I WIN])}<===="
    puts "=============================="
    run_ox( 1 )

    _oxaudit("EXIT","comp_win",0)
  end

  def self.human_win
    _oxaudit("ENTER","human_win",0)

    puts "======================="
    puts "====>{([YOU WIN])}<===="
    puts "======================="
    run_ox( 1 )

    _oxaudit("EXIT","human_win",0)
  end



  # BEG DEF ==============================================================================
  # BEG DEFchk_oxwin - DETERMINE if OXBOARD in WIN STATE =================================
  # BEG DEF ==============================================================================
  def self.chk_oxwin( bd )
    _oxaudit("ENTER","chk_oxwin( bd )",0)

    ox1=bd[0]+bd[1]+bd[2]
    ox2=bd[3]+bd[4]+bd[5]
    ox3=bd[6]+bd[7]+bd[8]
    ox4=bd[0]+bd[3]+bd[6]
    ox5=bd[1]+bd[4]+bd[7]
    ox6=bd[2]+bd[5]+bd[8]
    ox7=bd[0]+bd[4]+bd[8]
    ox8=bd[2]+bd[4]+bd[6]


    puts "OXWARN(CHK_OXWIN(1)):<#{ox1}>"
    puts "OXWARN(CHK_OXWIN(2)):<#{ox2}>"
    puts "OXWARN(CHK_OXWIN(3)):<#{ox3}>"
    puts "OXWARN(CHK_OXWIN(4)):<#{ox4}>"
    puts "OXWARN(CHK_OXWIN(5)):<#{ox5}>"
    puts "OXWARN(CHK_OXWIN(6)):<#{ox6}>"
    puts "OXWARN(CHK_OXWIN(7)):<#{ox7}>"
    puts "OXWARN(CHK_OXWIN(8)):<#{ox8}>"

    case ox1
      when "XXX"
        comp_win
      when "OOO"
        human_win
      else
        case ox2
          when "XXX"
            comp_win
          when "OOO"
            human_win
          else
            case ox3
              when "XXX"
                comp_win
              when "OOO"
                human_win
              else
                case ox4
                  when "XXX"
                    comp_win
                  when "OOO"
                    human_win
                  else
                    case ox5
                      when "XXX"
                        comp_win
                      when "OOO"
                        human_win
                      else
                        case ox6
                          when "XXX"
                            comp_win
                          when "OOO"
                            human_win
                          else
                            case ox7
                              when "XXX"
                                comp_win
                              when "OOO"
                                human_win
                              else
                                case ox8
                                  when "XXX"
                                    comp_win
                                  when "OOO"
                                    human_win
                                  else
                                    _oxaudit("EXIT","chk_oxwin( bd )",0)
                                    return false
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    _oxaudit("EXIT","chk_oxwin( bd )",0)
    return true

  end
  # END DEF ==============================================================================



  def self.is_oxvacant( oxline )
    _oxaudit("ENTER","is_oxvacant( oxline )",0)

    case oxline.gsub(/[^.]/i, '').to_s
      when "." || "..."
        _oxaudit("EXIT","is_oxvacant( oxline )",0)
        return true
    end

    _oxaudit("EXIT","is_oxvacant( oxline )",0)

    return false
  end


  # BEG DEF ==============================================================================================
  # BEG DEF get_oxcomp2 - EVALUTE COMPUTER move oxcomp ===================================================
  # BEG DEF bd=BOARD, oxcomp=COMPUTER_MOVE, oxnum={1-8}, oxi={0,1,2 etc}, oxj={0,1,2 etc}, oxk={0,1,2 etc}
  # BEG DEF ==============================================================================================
  def self.get_oxcomp2(bd, oxcomp, oxnum, oxi, oxj, oxk)
    _oxaudit("ENTER","get_oxcomp2(bd, oxcomp, oxnum, oxi, oxj, oxk)",0)

    ox1=bd[0]+bd[1]+bd[2]
    ox2=bd[3]+bd[4]+bd[5]
    ox3=bd[6]+bd[7]+bd[8]
    ox4=bd[0]+bd[3]+bd[6]
    ox5=bd[1]+bd[4]+bd[7]
    ox6=bd[2]+bd[5]+bd[8]
    ox7=bd[0]+bd[4]+bd[8]
    ox8=bd[2]+bd[4]+bd[6]

    oxwinline = bd[oxi]+bd[oxj]+bd[oxk]

    case oxwinline
    when "XX."
      else
        bd = get_oxcomp( bd, oxcomp )
    end


    oxcomp = oxcomp + 1 #Ensure we INCREASE COMPUTER MOVE OXCOMP by 1 since BOARD=[0,8]

    puts "I Shall Move to <#{oxcomp}>"

    oxcomp = oxcomp - 1 #Ensure we DECREASE HUMAN MOVE OXMOVE by 1 since BOARD=[0,8]

    bd[ oxcomp ] = "X"
    bd = display_oxboard( bd )

    chk_oxwin( bd )

    _oxaudit("EXIT","get_oxcomp2(bd, oxcomp, oxnum, oxi, oxj, oxk)",0)

    return bd

  end
  # END DEF ==============================================================================


  # BEG DEF ==============================================================================
  # BEG DEF get_oxcomp - EVALUTE COMPUTER move oxcomp ====================================
  # BEG DEF ==============================================================================
  def self.get_oxcomp( bd, oxcomp, oxlevel )
    _oxaudit("ENTER","get_oxcomp( bd, oxcomp, oxlevel )",0)

    ox1=bd[0]+bd[1]+bd[2]
    ox2=bd[3]+bd[4]+bd[5]
    ox3=bd[6]+bd[7]+bd[8]
    ox4=bd[0]+bd[3]+bd[6]
    ox5=bd[1]+bd[4]+bd[7]
    ox6=bd[2]+bd[5]+bd[8]
    ox7=bd[0]+bd[4]+bd[8]
    ox8=bd[2]+bd[4]+bd[6]

  if oxlevel==2
      #bd=get_oxcomp2(bd, oxcomp, 1, oxi, oxj, oxk)

      case is_oxvacant( ox1 )
        when true
          bd=get_oxcomp2(bd, oxcomp, 1, 0, 1, 2)
        else
          case is_oxvacant( ox2 )
            when true
              bd=get_oxcomp2(bd, oxcomp, 2, 3, 4, 5)
            else
              case is_oxvacant( ox3 )
                when true
                  bd=get_oxcomp2(bd, oxcomp, 3, 6, 7, 8)
                else
                  case is_oxvacant( ox4 )
                    when true
                      bd=get_oxcomp2(bd, oxcomp, 4, 0, 3, 6)
                    else
                      case is_oxvacant( ox5 )
                        when true
                          bd=get_oxcomp2(bd, oxcomp, 5, 1, 4, 7)
                        else
                          case is_oxvacant( ox6 )
                            when true
                              bd=get_oxcomp2(bd, oxcomp, 6, 2, 5, 8)
                            else
                              case is_oxvacant( ox7 )
                                when true
                                  bd=get_oxcomp2(bd, oxcomp, 7, 0, 4, 8)
                                else
                                  case is_oxvacant( ox8 )
                                    when true
                                      bd=get_oxcomp2(bd, oxcomp, 8, 2, 4, 6)
                                    else
                                      bd=get_oxcomp( bd, oxcomp, 1 )
                                  end
                              end
                          end
                      end
                  end
              end
          end
      end

  else
    #OX - Direct BATTLE MAKE COMP( X ) win
    case ox1
      when "XX."
        oxcomp = 2
      when "X.X"
        oxcomp = 1
      when ".XX"
        oxcomp = 0
      else
        case ox2
          when "XX."
            oxcomp = 5
          when "X.X"
            oxcomp = 4
          when ".XX"
            oxcomp = 3
          else
            case ox3
              when "XX."
                oxcomp = 8
              when "X.X"
                oxcomp = 5
              when ".XX"
                oxcomp = 2
              else

                #OX - ox4, ox5, ox6
                case ox4 #(0),(3),(6)
                  when "XX."
                    oxcomp = 6
                  when "X.X"
                    oxcomp = 3
                  when ".XX"
                    oxcomp = 0
                  else
                    case ox5 #(1),(4),(7)
                      when "XX."
                        oxcomp = 7
                      when "X.X"
                        oxcomp = 4
                      when ".XX"
                        oxcomp = 1
                      else
                        case ox6 #(2),(5),(8)
                          when "XX."
                            oxcomp = 8
                          when "X.X"
                            oxcomp = 5
                          when ".XX"
                            oxcomp = 2
                          else
                            #OX - ox7, ox8
                            case ox7 #(0),(4),(8)
                              when "XX."
                                oxcomp = 8
                              when "X.X"
                                oxcomp = 4
                              when ".XX"
                                oxcomp = 0
                              else
                                case ox8 #(2),(4),(6)
                                  when "XX."
                                    oxcomp = 6
                                  when "X.X"
                                    oxcomp = 4
                                  when ".XX"
                                    oxcomp = 2
                                  else

                                    #OX - Direct BATTLE STOP HUMAN( O ) win
                                    case ox1
                                    when "OO."
                                        oxcomp = 2
                                      when "O.O"
                                        oxcomp = 1
                                      when ".OO"
                                        oxcomp = 0
                                      else
                                        case ox2
                                        when "OO."
                                            oxcomp = 5
                                          when "O.O"
                                            oxcomp = 4
                                          when ".OO"
                                            oxcomp = 3
                                          else
                                            case ox3
                                            when "OO."
                                                oxcomp = 8
                                              when "O.O"
                                                oxcomp = 5
                                              when ".OO"
                                                oxcomp = 2
                                              else

                                                #OX - ox4, ox5, ox6
                                                case ox4 #(0),(3),(6)
                                                when "OO."
                                                    oxcomp = 6
                                                  when "O.O"
                                                    oxcomp = 3
                                                  when ".OO"
                                                    oxcomp = 0
                                                  else
                                                    case ox5 #(1),(4),(7)
                                                    when "OO."
                                                        oxcomp = 7
                                                      when "O.O"
                                                        oxcomp = 4
                                                      when ".OO"
                                                        oxcomp = 1
                                                      else
                                                        case ox6 #(2),(5),(8)
                                                        when "OO."
                                                            oxcomp = 8
                                                          when "O.O"
                                                            oxcomp = 5
                                                          when ".OO"
                                                            oxcomp = 2
                                                          else
                                                            #OX - ox7, ox8
                                                            case ox7 #(0),(4),(8)
                                                            when "OO."
                                                                oxcomp = 8
                                                              when "O.O"
                                                                oxcomp = 4
                                                              when ".OO"
                                                                oxcomp = 0
                                                              else
                                                                case ox8 #(2),(4),(6)
                                                                when "OO."
                                                                    oxcomp = 6
                                                                  when "O.O"
                                                                    oxcomp = 4
                                                                  when ".OO"
                                                                    oxcomp = 2
                                                                  else

                                                                    #OX - EVALUATE other BOARD states
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

                                                                      when "X.X"+"OO."+"..O"
                                                                        oxcomp = 1
                                                                      when "X.X"+".OO"+"..O"
                                                                        oxcomp = 1
                                                                      when "X.X"+"O.O"+"..O"
                                                                        oxcomp = 1

                                                                      when "X.X"+"OO."+".O."
                                                                        oxcomp = 1
                                                                      when "X.X"+"O.O"+".O."
                                                                        oxcomp = 1
                                                                      when "X.X"+".OO"+".O."
                                                                        oxcomp = 1
                                                                      when "X.X"+"OO."+"O.."
                                                                        oxcomp = 1


                                                                      when "X.X"+"O.."+"O.O"
                                                                        oxcomp = 1
                                                                      when "X.X"+"O.."+".OO"
                                                                        oxcomp = 1
                                                                      when "X.X"+"O.."+"OO."
                                                                        oxcomp = 1

                                                                      else
                                                                        oxcomp = 4
                                                                    end #END CASE - OX - EVALUATE other BOARD states


                                                                end
                                                            end #END - CASE OX - ox7, ox8
                                                        end
                                                    end
                                                end #END - CASE OX - ox4, ox5, ox6

                                            end
                                        end
                                    end #END - CASE - OX - Direct BATTLE STOP HUMAN( O ) win


                                end
                            end #END - CASE OX - ox7, ox8
                        end
                    end
                end #END - CASE OX - ox4, ox5, ox6
            end
        end
    end  #END - CASE - MAIN CASE

  end #END - IF ( OXLEVEL )

    oxcomp = oxcomp + 1 #Ensure we INCREASE COMPUTER MOVE OXCOMP by 1 since BOARD=[0,8]

    puts "I Shall Move to <#{oxcomp}>"

    oxcomp = oxcomp - 1 #Ensure we DECREASE HUMAN MOVE OXMOVE by 1 since BOARD=[0,8]

    bd[ oxcomp ] = "X"
    bd = display_oxboard( bd )

    chk_oxwin( bd )

    _oxaudit("EXIT","get_oxcomp( bd, oxcomp )",0)

    return bd
  end
  # END DEF ==============================================================================



  # BEG DEF ==============================================================================
  # BEG DEF ox - Play NAUGHTS & CROSSES --- HUMAN vs COMPUTER ============================
  # BEG DEF ==============================================================================
  def self.ox
    _oxaudit("ENTER","ox",0)

      make_cls

      empty_board = display_oxboard(".........")
      board = empty_board

      first_move = get_oxmove( board, "" ) #Logically we MUST OBTAIN AT LEATS (1) MOVE
      human_move = first_move + 1 #Ensure we INCREASE COMPUTER MOVE OXCOMP by 1 since BOARD=[0,8]
      comp_move = -1
      print "OK, you moved<#{human_move}> ...... "
      board = get_oxcomp( board, comp_move, 1 )

          #NOW each subsequent move by HUMAN stored in HUMAN_MOVE
          while !chk_oxwin( board  )
            case human_move = get_oxmove( board, "" )
              when 1..9
                human_move = human_move + 1 #Ensure we INCREASE COMPUTER MOVE OXCOMP by 1 since BOARD=[0,8]
                #if !chk_oxwin( board )
                  chk_oxwin( board )
                  print "OK, you moved<#{human_move}> ...... "
                  board = get_oxcomp( board, comp_move, 1 )
                #end
            end #END - CASE ==================================================
          end #END - WHILE ===================================================

  _oxaudit("EXIT","ox",0)
  end
  # END DEF ==============================================================================




  # BEG DEF ==============================================================================
  # BEG DEF get_oxmove - Obtain HUMANS move either via --name [VAR] or input =============
  # BEG DEF ==============================================================================
  def self.get_oxmove( bd, str )
    _oxaudit("ENTER","get_oxmove( bd, str )",0)

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
      while oxmove == "~"  do
        oxmove = gets
        oxmove = oxmove.to_s.downcase.gsub(/[^1-9]/i, '').to_i
        if !is_oxvacant( bd[oxmove] )
          puts "OXWARN(002):<#{oxmove}> is OCCUPIED <#{oxmove}>=<#{bd[oxmove]}> - Please trye another move..."
        else
          case oxmove
            when 1..9
              puts "Thank You - Your Move=<#{oxmove}>"
            else
              puts "OXWARN(003):<#{oxmove}> Please Enter Your Move-{1 - 9}"
              oxmove = "~"
          end# END - CASE
        end# END - IF
      end
    end

    oxmove = oxmove-1 #Ensure we DECREASE HUMAN MOVE OXMOVE by 1 since BOARD=[0,8]

    bd[ oxmove ]="O"
    bd = display_oxboard( bd )

    _oxaudit("EXIT","get_oxmove( bd, str )",0)

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
      #get_oxmove( str )
      run_ox( str )
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
