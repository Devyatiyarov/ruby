require_relative '../app_context'
require_relative './save'
require 'io/console'

class InputValue < State
  attr_accessor :index

  def number?(value)
    value.to_f.to_s == value || value.to_i.to_s == value
  end

  def render
    @value = $stdin.gets.to_s.chomp
  end

  def next
    if number? @value
      @context.transition_to Save.new(@value)
    else
      @context.transition_to OutputValue.new is_number: false
    end
  end
end
