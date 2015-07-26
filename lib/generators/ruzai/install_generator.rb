module Ruzai
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def install
      @model_class_name = args[0] || "User"
      template "ruzai_parameters.rb", "db/migrate/#{Time.now.strftime("%Y%m%d%H%M%d")}_ruzai_parameters.rb"
    end
  end
end
