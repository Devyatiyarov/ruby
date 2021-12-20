require_relative '../app_context'
require_relative './input_type'

class OutputType < State
  def initialize(index = 0)
    super()
    @index = index
  end

  def max_index
    @context.types.size - 1
  end

  def types
    @context.types
  end

  def print_top
    if @context.from_type == ''
      print "convert from #{types[@index]} "
    else
      print "convert from #{@context.from_type} "
    end

    print "to #{types[@index]} " if @context.from_type != ''

    print "\n"
  end

  def print_main
    (0..max_index).each do |i|
      print "\e[48;2;255;90;0m" if @index == i
      print "#{i}) #{types[i]}\n\e[48;2;0;0;0m"
    end
    print "\n"
  end

  def print_botton
    print "Help:\n"
    print "use the up and down arrows to select\n"
    print "press q to exit\n"
  end

  def render
    system 'clear'
    print_top
    print_main
    print_botton
  end

  def next
    @context.transition_to InputType.new(@index)
  end
end
