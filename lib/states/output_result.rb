require_relative '../app_context'
require_relative './exit'
require_relative './clear'

class OutputResult < State
  def initialize(value)
    super()
    @value = value
  end

  def print_top
    print "Done:\n"
  end

  def print_main
    print "#{@context.value} #{@context.from_type} = #{@value} #{@context.to_type}\n"
  end

  def print_botton
    print "\npress enter to continue\n"
    print "press q to exit\n"
  end

  def render
    print_top
    print_main
    print_botton

    # @key = ''
    @key = $stdin.getch while @key != 'q' && @key != "\r"
  end

  def next
    if @key == 'q'
      @context.transition_to Exit.new
    else
      @context.transition_to Clear.new
    end
  end
end
