module Hourglass
  module RedminePatches
    module ProjectsHelperPatch
      extend ActiveSupport::Concern

      def project_settings_tabs
        super.tap do |tabs|
          tabs << {name: Hourglass::PLUGIN_NAME.to_s, partial: 'projects/hourglass_settings', label: 'hourglass.project_settings.title'} if @project.module_enabled?(Hourglass::PLUGIN_NAME) && User.current.allowed_to?(:select_project_modules, @project)
        end
      end
    end
  end
end
