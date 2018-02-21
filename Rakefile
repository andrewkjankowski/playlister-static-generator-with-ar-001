require 'sinatra/activerecord/rake'

task :environment do
  ENV["PLAYLISTER_ENV"] ||= "development"
  require_relative './config/environment'
end

namespace :db do
  task :migrate => :environment do
    migrate_db
    Rake::Task["db:schema"].invoke
  end

  task :drop => :environment do 
    drop_db
  end

  task :seed => :environment do
    LibraryParser.new('db/data').parse_and_insert_songs
  end
  
desc 'Create a db/schema.rb file that is portable against any DB supported by AR'
  task :schema do
    require 'active_record/schema_dumper'
    filename = "db/schema.rb"
    File.open(filename, "w:utf-8") do |file|
      ActiveRecord::SchemaDumper.dump(ActiveRecord::Base.connection, file)
    end
  end

end

task :console => :environment do
  Pry.start
end

task :generate => :environment do
  SiteGenerator.new("_site").generate
end
