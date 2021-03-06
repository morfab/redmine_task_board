require 'redmine'

# Patches to the Redmine core.  Will not work in development mode
require_dependency 'issue_patch'

Redmine::Plugin.register :redmine_task_board do
  name 'Redmine Task Board plugin'
  author 'Chris Rosser'
  description 'Provide a task board for a version'
  version '0.0.1'
  
  menu :project_menu, :task_boards, { :controller => 'task_boards', :action => 'index' }, :caption => 'Task board', :after => :activity, :param => :project_identifier

  project_module :task_board do
    permission :view_task_board, :task_boards => [:index, :show]
  end
end
