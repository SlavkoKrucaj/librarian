require 'thor'
require 'librarian'

module Librarian
  class Cli < Thor
    desc 'library', 'Auto-generates a Library pod'
    method_option :name, type: :string, aliases: '-n', desc: 'Name of the project'
    method_option :output, type: :string, aliases: '-o', desc: 'Location of the output directory'
    def generate
      library_generator(options[:name], options[:output]).generate
    end

    private
    def library_generator(project_name, output_folder)
      Librarian::LibraryGenerator.new(project_name, '__LIBRARY_PROJECT_NAME__', output_folder)
    end
  end
end