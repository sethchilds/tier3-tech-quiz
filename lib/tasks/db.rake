namespace :db do
  desc "Rebuild local database from seeds"
  task refresh: :environment do
    %w[db:drop db:create db:schema:load db:seed].each do |name|
      Rake::Task[name].invoke
    end
  end
end

