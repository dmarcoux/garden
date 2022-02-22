# frozen_string_literal: true

namespace :development do
  desc "Setup .*_history files to keep command history in Docker setup"
  task setup_history_files: :environment do
    bash_history = Rails.root.join("docker-files/home/.bash_history")
    File.new(bash_history, "w+") unless File.exist?(bash_history)
    irb_history = Rails.root.join("docker-files/home/.irb_history")
    File.new(irb_history, "w+") unless File.exist?(irb_history)
    debug_history = Rails.root.join("docker-files/home/.rdbg_history")
    File.new(debug_history, "w+") unless File.exist?(debug_history)
  end
end
