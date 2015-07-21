module Ruzai
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def install
      copy_file "ruzai_parameters.rb", "db/migrate/ruzai_parameters.rb"
    end
  end
end
