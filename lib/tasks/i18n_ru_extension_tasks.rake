namespace :radiant do
  namespace :extensions do
    namespace :ru do
      
      desc "Runs the migration of the I18n Ru extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          RussianLanguagePackExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          RussianLanguagePackExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the I18n Ru to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from I18nRuExtension"
        Dir[RussianLanguagePackExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(RussianLanguagePackExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory, :verbose => false
          cp file, RAILS_ROOT + path, :verbose => false
        end
      end  
    end
  end
end
