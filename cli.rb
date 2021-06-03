#ruby
#!/usr/bin/env ruby
require 'optparse'


class CliGuess


  def self._oxaudit(str1, str2, on)
    if on
      puts "OXAUDIT - #{str1.upcase.to_s} - #{str2.upcase.to_s}"
      File.write('cli_OUT.ifo', "OXAUDIT - #{str1.upcase.to_s} - #{str2.upcase.to_s}\n", mode: 'a')
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
      _oxaudit( "  ","display_oxboard(bd)",0)
      _oxaudit( " #{bd[0]} | #{bd[1]} | #{bd[2]} ","display_oxboard(bd)",0)
      _oxaudit( separator = "-----------","display_oxboard(bd)",0)
      _oxaudit( " #{bd[3]} | #{bd[4]} | #{bd[5]} ","display_oxboard(bd)",0)
      _oxaudit( separator,"display_oxboard(bd)",0)
      _oxaudit( " #{bd[6]} | #{bd[7]} | #{bd[8]} ","display_oxboard(bd)",0)
      _oxaudit( "  ","display_oxboard(bd)",0)
    else
      puts "OXWARN(001):The BOARD must exist prior to display"
      _oxaudit( "OXWARN(001):The BOARD must exist prior to display","display_oxboard(bd)",0)
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



  def self.human_comp_draw
    _oxaudit("ENTER","human_comp_draw",0)

    puts "=============================="
    puts "=========>{([DRAW])}<========="
    puts "=============================="
    run_ox( 1 )

    _oxaudit("EXIT","human_comp_draw",0)
  end


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
  # BEG DEFchk_oxdraw - DETERMINE if OXBOARD in DRAW STATE ===============================
  # BEG DEF ==============================================================================
  def self.chk_oxdraw( bd )
    _oxaudit("ENTER","chk_oxdraw( bd )",0)

    ox1=bd[0]+bd[1]+bd[2]
    ox2=bd[3]+bd[4]+bd[5]
    ox3=bd[6]+bd[7]+bd[8]
    ox4=bd[0]+bd[3]+bd[6]
    ox5=bd[1]+bd[4]+bd[7]
    ox6=bd[2]+bd[5]+bd[8]
    ox7=bd[0]+bd[4]+bd[8]
    ox8=bd[2]+bd[4]+bd[6]


    puts "OXWARN(CHK_OXDRAW(1)):<#{ox1}>"
    puts "OXWARN(CHK_OXDRAW(2)):<#{ox2}>"
    puts "OXWARN(CHK_OXDRAW(3)):<#{ox3}>"
    puts "OXWARN(CHK_OXDRAW(4)):<#{ox4}>"
    puts "OXWARN(CHK_OXDRAW(5)):<#{ox5}>"
    puts "OXWARN(CHK_OXDRAW(6)):<#{ox6}>"
    puts "OXWARN(CHK_OXDRAW(7)):<#{ox7}>"
    puts "OXWARN(CHK_OXDRAW(8)):<#{ox8}>"

    _oxaudit("OXWARN(CHK_OXDRAW(1)):<#{ox1}>","chk_oxdraw( bd )",0)
    _oxaudit("OXWARN(CHK_OXDRAW(2)):<#{ox2}>","chk_oxdraw( bd )",0)
    _oxaudit("OXWARN(CHK_OXDRAW(3)):<#{ox3}>","chk_oxdraw( bd )",0)
    _oxaudit("OXWARN(CHK_OXDRAW(4)):<#{ox4}>","chk_oxdraw( bd )",0)
    _oxaudit("OXWARN(CHK_OXDRAW(5)):<#{ox5}>","chk_oxdraw( bd )",0)
    _oxaudit("OXWARN(CHK_OXDRAW(6)):<#{ox6}>","chk_oxdraw( bd )",0)
    _oxaudit("OXWARN(CHK_OXDRAW(7)):<#{ox7}>","chk_oxdraw( bd )",0)
    _oxaudit("OXWARN(CHK_OXDRAW(8)):<#{ox8}>","chk_oxdraw( bd )",0)

    if ! chk_oxwin( bd )
      case is_oxfull( ox1 )
        when TRUE
          case is_oxfull( ox2 )
            when TRUE
              case is_oxfull( ox3 )
                when TRUE
                  case is_oxfull( ox4 )
                    when TRUE
                      case is_oxfull( ox5 )
                        when TRUE
                          case is_oxfull( ox6 )
                            when TRUE
                              case is_oxfull( ox7 )
                                when TRUE
                                  case is_oxfull( ox8 )
                                    when TRUE
                                      human_comp_draw
                                      _oxaudit("EXIT(T)","chk_oxdraw( bd )",0)
                                      return true
                                    else
                                      _oxaudit("EXIT(F)","chk_oxdraw( bd )",0)
                                      return false
                                  end
                              end
                          end
                      end
                  end
              end
          end
      end
    end #END - IF

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

    _oxaudit("OXWARN(CHK_OXWIN(1)):<#{ox1}>","chk_oxwin( bd )",0)
    _oxaudit("OXWARN(CHK_OXWIN(2)):<#{ox2}>","chk_oxwin( bd )",0)
    _oxaudit("OXWARN(CHK_OXWIN(3)):<#{ox3}>","chk_oxwin( bd )",0)
    _oxaudit("OXWARN(CHK_OXWIN(4)):<#{ox4}>","chk_oxwin( bd )",0)
    _oxaudit("OXWARN(CHK_OXWIN(5)):<#{ox5}>","chk_oxwin( bd )",0)
    _oxaudit("OXWARN(CHK_OXWIN(6)):<#{ox6}>","chk_oxwin( bd )",0)
    _oxaudit("OXWARN(CHK_OXWIN(7)):<#{ox7}>","chk_oxwin( bd )",0)
    _oxaudit("OXWARN(CHK_OXWIN(8)):<#{ox8}>","chk_oxwin( bd )",0)

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
                                    _oxaudit("EXIT(F)","chk_oxwin( bd )",0)
                                    chk_oxdraw( bd )
                                    return false
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    _oxaudit("EXIT(T)","chk_oxwin( bd )",0)
    return true

  end
  # END DEF ==============================================================================



  def self.is_oxfull( oxline )
    _oxaudit("ENTER","is_oxfull( oxline )",0)

    puts "oxline=<#{oxline}> oxline.gsub=<#{oxline.upcase.to_s}>"
    _oxaudit("oxline=<#{oxline}> oxline.gsub=<#{oxline.upcase.to_s}>","is_oxfull( oxline )",0)

    case oxline.upcase.to_s
    when "XXO" || "XOX" || "OXX" || "XOO" || "OXO" || "OOX" #JO - Deliberately NOT {xxx or ooo} WINLINES
        _oxaudit("EXIT(T)","is_oxfull( oxline )",0)
        return true
    end

    _oxaudit("EXIT(F)","is_oxfull( oxline )",0)

    return false
  end


  def self.is_oxblank( oxline )
    _oxaudit("ENTER","is_oxblank( oxline )",0)

    puts "oxline=<#{oxline}> oxline.gsub=<#{oxline.upcase.to_s}>"
    _oxaudit("oxline=<#{oxline}> oxline.gsub=<#{oxline.upcase.to_s}>","is_oxblank( oxline )",0)

    case oxline.upcase.to_s
    when "..."
        _oxaudit("EXIT(T)","is_oxblank( oxline )",0)
        return true
    end

    _oxaudit("EXIT(F)","is_oxblank( oxline )",0)

    return false
  end



  def self.is_oxvacant( oxline )
    _oxaudit("ENTER","is_oxvacant( oxline )",0)

    puts "oxline=<#{oxline}> oxline.gsub=<#{oxline.upcase.to_s}>"
    _oxaudit("oxline=<#{oxline}> oxline.gsub=<#{oxline.upcase.to_s}>","is_oxvacant( oxline )",0)

    case oxline.upcase.to_s
    when ".","...","XX.","X.X",".XX","OO.","O.O",".OO","X.O",".XO","O.X",".OX","XO.","OX."
        _oxaudit("EXIT(T)","is_oxvacant( oxline )",0)
        return true
    end

    _oxaudit("EXIT(F)","is_oxvacant( oxline )",0)

    return false
  end

  def self.is_oxoccupied( oxline )
    _oxaudit("ENTER","is_oxoccupied( oxline )",0)

    puts "oxline=<#{oxline}> oxline.gsub=<#{oxline.upcase.to_s}>"
    _oxaudit("oxline=<#{oxline}> oxline.gsub=<#{oxline.upcase.to_s}>","is_oxoccupied( oxline )",0)

    case oxline.upcase.to_s
    when "X" || "O" || "XXX" || "OOO" || "XXO" || "XOX" || "OXX" || "XOO" || "OXO" || "OOX"
        _oxaudit("EXIT(T)","is_oxoccupied( oxline )",0)
        return true
    end

    _oxaudit("EXIT(F)","is_oxoccupied( oxline )",0)

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
    puts "OXWARN(GET_OXCOMP2(oxwinline)):<#{bd[oxi]}+#{bd[oxj]}+#{bd[oxk]}>"
    _oxaudit("OXWARN(GET_OXCOMP2(oxwinline)):<#{bd[oxi]}+#{bd[oxj]}+#{bd[oxk]}>","get_oxcomp2(bd, oxcomp, oxnum, oxi, oxj, oxk)",0)

    case oxwinline
      when "XO."
        case oxnum
          when 1
            oxcomp = 2
          when 2
            oxcomp = 5
          when 3
            oxcomp = 8
          when 4
            oxcomp = 6
          when 5
            oxcomp = 7
          when 6
            oxcomp = 8
          when 7
            oxcomp = 8
          when 8
            oxcomp = 6
          else
        end
      when "XX."
        case oxnum
          when 1
            oxcomp = 2
          when 2
            oxcomp = 5
          when 3
            oxcomp = 8
          when 4
            oxcomp = 6
          when 5
            oxcomp = 7
          when 6
            oxcomp = 8
          when 7
            oxcomp = 8
          when 8
            oxcomp = 6
          else
        end
      when ".XX"
        case oxnum
          when 1
            oxcomp = 0
          when 2
            oxcomp = 3
          when 3
            oxcomp = 6
          when 4
            oxcomp = 0
          when 5
            oxcomp = 1
          when 6
            oxcomp = 2
          when 7
            oxcomp = 0
          when 8
            oxcomp = 2
          else
        end
      when "X.X"
        case oxnum
          when 1
            oxcomp = 1
          when 2
            oxcomp = 4
          when 3
            oxcomp = 7
          when 4
            oxcomp = 3
          when 5
            oxcomp = 4
          when 6
            oxcomp = 5
          when 7
            oxcomp = 4
          when 8
            oxcomp = 4
          else
        end
      when "X.."
        case oxnum
          when 1
            oxcomp = 1
          when 2
            oxcomp = 4
          when 3
            oxcomp = 7
          when 4
            oxcomp = 3
          when 5
            oxcomp = 4
          when 6
            oxcomp = 5
          when 7
            oxcomp = 7
          when 8
            oxcomp = 4
          else
        end
      when ".X."
        case oxnum
          when 1
            oxcomp = 0
          when 2
            oxcomp = 3
          when 3
            oxcomp = 6
          when 4
            oxcomp = 0
          when 5
            oxcomp = 1
          when 6
            oxcomp = 2
          when 7
            oxcomp = 0
          when 8
            oxcomp = 2
          else
        end
      when "..X"
        case oxnum
          when 1
            oxcomp = 0
          when 2
            oxcomp = 3
          when 3
            oxcomp = 6
          when 4
            oxcomp = 0
          when 5
            oxcomp = 1
          when 6
            oxcomp = 2
          when 7
            oxcomp = 0
          when 8
            oxcomp = 2
          else
        end


      else
        bd = get_oxcomp( bd, oxcomp, 1 )
    end


    oxcomp = oxcomp + 1 #Ensure we INCREASE COMPUTER MOVE OXCOMP by 1 since BOARD=[0,8]

    puts "I Shall Move to <#{oxcomp}>"
    _oxaudit("I Shall Move to <#{oxcomp}>","get_oxcomp2(bd, oxcomp, oxnum, oxi, oxj, oxk)",0)

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
      #bd=get_oxcomp2(bd, oxcomp, oxnum, oxi, oxj, oxk)

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

      #J.O. N.B. COMPUTER has already made a move, via OXCOMP2(LEVEL==2)
      _oxaudit("EXIT","get_oxcomp( bd, oxcomp )",0)
      return bd
      #J.O. N.B. COMPUTER has already made a move, via OXCOMP2(LEVEL==2)

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
                                                                        case ox4+ox8
                                                                          when "X.."+".X."
                                                                            oxcomp = 6
                                                                          when "X.."+"..X"
                                                                            oxcomp = 4
                                                                          when "X.."+"X.."
                                                                            oxcomp = 4
                                                                          when ".X."+".X."
                                                                            oxcomp = 0
                                                                          when ".X."+"..X"
                                                                            oxcomp = 0
                                                                          else
                                                                            oxcomp = 4
                                                                        end #END - CASE
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

  if is_oxvacant( bd[ oxcomp ])
    oxcomp = oxcomp + 1 #Ensure we INCREASE COMPUTER MOVE OXCOMP by 1 since BOARD=[0,8]

    puts "I Shall Move to <#{oxcomp}>"
    _oxaudit("I Shall Move to <#{oxcomp}>","get_oxcomp( bd, oxcomp )",0)

    oxcomp = oxcomp - 1 #Ensure we DECREASE HUMAN MOVE OXMOVE by 1 since BOARD=[0,8]

    bd[ oxcomp ] = "X"
    bd = display_oxboard( bd )

    chk_oxwin( bd )

    _oxaudit("EXIT","get_oxcomp( bd, oxcomp )",0)

    return bd
  else
    bd = get_oxcomp( bd, oxcomp, 2 )
  end #END - IF
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
      _oxaudit("OK, you moved<#{human_move}> ...... ","ox",0)
      board = get_oxcomp( board, comp_move, 1 )

          #NOW each subsequent move by HUMAN stored in HUMAN_MOVE
          while !chk_oxwin( board  )
            case human_move = get_oxmove( board, "" )
              when 1..9
                human_move = human_move + 1 #Ensure we INCREASE COMPUTER MOVE OXCOMP by 1 since BOARD=[0,8]
                #if !chk_oxwin( board )
                  chk_oxwin( board )
                  print "OK, you moved<#{human_move}> ...... "
                  _oxaudit("OK, you moved<#{human_move}> ...... ","ox",0)
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
      _oxaudit("Please Enter Your Move-{1 - 9}","get_oxmove( bd, str )",0)
      oxmove = "~"
      while oxmove == "~"  do
        oxmove = gets
        oxmove = oxmove.to_s.downcase.gsub(/[^1-9]/i, '').to_i
        if is_oxvacant( bd[oxmove-1] ) #Ensure we DECREASE HUMAN MOVE OXMOVE by 1 since BOARD=[0,8]
          case oxmove
            when 1..9
              puts "Thank You - Your Move=<#{oxmove}>"
              _oxaudit("Thank You - Your Move=<#{oxmove}>","get_oxmove( bd, str )",0)
            else
              puts "OXWARN(003):<#{oxmove}> Please Enter Your Move-{1 - 9}"
              _oxaudit("OXWARN(003):<#{oxmove}> Please Enter Your Move-{1 - 9}","get_oxmove( bd, str )",0)
              oxmove = "~"
          end# END - CASE
        else
          puts "OXWARN(002):<#{oxmove}> is OCCUPIED <#{oxmove}>=<#{bd[oxmove]}> - Please trye another move..."
          _oxaudit("OXWARN(002):<#{oxmove}> is OCCUPIED <#{oxmove}>=<#{bd[oxmove]}> - Please trye another move...","get_oxmove( bd, str )",0)
          oxmove = "~"
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
