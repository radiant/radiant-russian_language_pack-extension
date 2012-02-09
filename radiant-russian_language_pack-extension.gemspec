# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "radiant-russian_language_pack-extension/version"

Gem::Specification.new do |s|
  s.name        = "radiant-russian_language_pack-extension"
  s.version     = RadiantRussianLanguagePackExtension::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Radiant CMS Dev Team"]
  s.email       = ["radiant@radiantcms.org"]
  s.homepage    = "http://radiantcms.org/"
  s.summary     = %q{Russian Language Pack for Radiant CMS}
  s.description = %q{Russian language pack for Radiant CMS}

  ignores = if File.exist?(".gitignore")
    File.read(".gitignore").split("\n").inject([]) {|a,p| a + Dir[p] }
  else
    []
  end
  s.files         = Dir["**/*"] - ignores
  s.test_files    = Dir["test/**/*","spec/**/*","features/**/*"] - ignores
  s.require_paths = ["lib"]

  # s.add_dependency "some_gem", "~> 1.0.0"

  s.post_install_message = %{
  Add this to your radiant project with:
    config.gem "radiant-russian_language_pack-extension", :version => "~> #{RadiantRussianLanguagePackExtension::VERSION}"
  }
end
