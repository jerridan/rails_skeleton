# frozen_string_literal: true
require 'rubocop/rake_task'

desc 'Run RuboCop'
RuboCop::RakeTask.new('rubocop') do |task|
  task.options = %w(--display-cop-names)
end
