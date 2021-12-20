require_relative './states/output_type'
require_relative './app_context'

class App
  def run
    system 'clear'
    context = AppContext.new(OutputType.new)
    until context.state.is_a? Exit
      context.render
      context.next
    end
  end
end
