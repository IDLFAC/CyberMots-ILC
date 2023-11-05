# frozen_string_literal: true

# correction de singe afin de pouvoir traduire le nom des sections
# https://github.com/piotrmurach/tty-option/issues/11
module TTY
  module Option
    class Formatter
      def initialize(parameters, usage, param_display: DEFAULT_PARAM_DISPLAY,
                     width: DEFAULT_WIDTH, order: DEFAULT_ORDER, indent: 0)
        @parameters = parameters
        @usage = usage
        @param_display = param_display
        @order = order
        @width = width
        @indent = indent
        @space_indent = SPACE * indent
        @param_indent = indent + 2
        @section_names = {
          usage: 'Utilisation :',
          arguments: 'Arguments :',
          keywords: 'Mots clés :',
          options: 'Options :',
          env: 'Environement :',
          examples: 'Exemples :'
        }
      end
    end
  end
end
