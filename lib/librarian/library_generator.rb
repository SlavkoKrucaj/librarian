module Librarian
  class LibraryGenerator
    def initialize(project_name, template_name, output_folder = Dir.pwd)
      @project_name = project_name
      @template_name = template_name
      @output_folder = output_folder
    end

    def generate
      begin
        copy_project_to_new_location
        rename_template
      rescue Exception => exception
        FileUtils.rm_rf(project_path)
        raise exception
      end
    end

    private
    attr_reader :project_name, :template_name, :output_folder

    def copy_project_to_new_location
      FileUtils.cp_r(template_path, project_path)
    end

    def rename_template

      Dir.glob(glob_project_path).reverse.each do |path|
        new_path = File.join(File.dirname(path), substitute_template_with_project(File.basename(path)))
        File.rename(path, new_path)

        if !File.directory? new_path
          new_content = substitute_template_with_project(File.read(new_path))
          File.open(new_path, 'w') {|file| file.puts new_content }
        end
      end
    end

    def substitute_template_with_project(text)
      text.encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '').gsub(template_name, project_name)
    end

    def glob_project_path
      File.join(project_path, '**/*')
    end

    def project_path
      File.join(output_folder, project_name)
    end

    def template_path
      File.join(File.dirname(__FILE__), '..', '..', 'resources', template_name)
    end
  end
end
