# frozen_string_literal: true

require "English" # for $CHILD_STATUS

# From upstream https://github.com/thoughtbot/factory_bot/blob/fc098ffbc3da55e7e2d5962c6ffe1c06df8770d6/GETTING_STARTED.md#linting-factories
namespace :factorybot do
  desc "Verify that all FactoryBot factories are valid"
  task lint: :environment do |task|
    if Rails.env.test?
      conn = ActiveRecord::Base.connection
      conn.transaction do
        FactoryBot.lint traits: true, verbose: true
        raise ActiveRecord::Rollback
      end
    else
      system("bundle exec rake #{task.name} RAILS_ENV='test'")
      raise if $CHILD_STATUS.exitstatus.nonzero?
    end
  end
end
