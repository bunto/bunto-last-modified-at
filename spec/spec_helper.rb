require "rubygems"
require 'spork'
require 'rspec'
#require 'spork/ext/ruby-debug'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.

  require "bunto"
  require "liquid"

  include Bunto
end

Spork.each_run do
  # This code will be run each time you run your specs.
  require File.expand_path("lib/bunto-last-modified-at.rb")
end

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:all) do
    if Bunto::VERSION >= "2"
      Bunto.logger.log_level = :error
    else
      Bunto.logger.log_level = Bunto::Stevenson::ERROR
    end

    original_stderr = $stderr
    original_stdout = $stdout

    @fixtures_path = Pathname.new(__FILE__).parent.join("fixtures")
    @dest = @fixtures_path.join("_site")
    @posts_src = File.join(@fixtures_path, "_posts")
    @layouts_src = File.join(@fixtures_path, "_layouts")
    @plugins_src = File.join(@fixtures_path, "_plugins")

    $stderr = File.new(File.join(File.dirname(__FILE__), 'dev', 'null.txt'), 'w')
    $stdout = File.new(File.join(File.dirname(__FILE__), 'dev', 'null.txt'), 'w')

    @site = Bunto::Site.new(Bunto.configuration({
      "source"      => @fixtures_path.to_s,
      "destination" => @dest.to_s,
      "plugins"     => @plugins_src
    }))

    @dest.rmtree if @dest.exist?
    @site.process
  end

  config.after(:all) do
    @dest.rmtree if @dest.exist?
  end

  def post_path(file)
    File.join(@posts_src, file)
  end

  def duplicate_post(source, destination)
    File.open(post_path(destination), "w") do |f|
      f.puts(File.read(post_path(source)))
    end
  end

  def setup_post(file)
    Post.new(@site, @fixtures_path, '', file)
  end

  def do_render(post, layout)
    layouts = { layout.sub(/\.html/, '') => Layout.new(@site, @layouts_src, layout)}
    post.render(layouts, {"site" => {"posts" => []}})
  end
end
