#!/usr/bin/env ruby
require "thor"
begin
  File.read "./config.rb"
rescue => err
  config = File.new("config.rb", "w")
  config.puts "#!/usr/bin/env ruby
  $endpoints = [
    # example 'users/13',
    # example 'users/4',
  ]
  $urls = [
    # example 'https://api.example.com',
    # example 'https://api.example.com'
  ]
  # $extra_args = \" example: -H 'Authorization: Token token=\\\"example_token\\\"' -H 'X_API_EMAIL: example@example.com'\"
  $verbose = false
  $seconds = '3'

  "
  puts "confing file created. Please update config.rb and try again"
  exit
end
require "./config.rb"

class HomeWrecker < Thor
  desc "wreck", "Attack the Castle."
  
  def wreck
    $extra_args ||= ""
    siege_check = `which siege`
    if siege_check == ""
      say "please ensure that siege is installed. run: $ brew install siege", :red
      exit
    end
    file = File.new("seige_output.html", "w")
    file.puts '<body><head><script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" /><style>.url{background-color: orange;} td{white-space: pre; vertical-align:top}</style></head><table class="table table-striped"><thead>'
    $urls.each do |url|
      file.puts "<th>#{url}</th>"
    end
    file.puts '</thead><tbody>'
    $endpoints.each do |endpoint|
      file.puts '<tr align="top">'
      $urls.each do |url|
        final_url = "#{url}/#{endpoint}"
        say "hitting #{final_url} for #{$seconds} seconds", :green
        cmd = "siege -v -b -t#{$seconds}S #{final_url} #{$extra_args}"
        file.puts '<td>'
        file.puts "<span class='url'>#{final_url}</span><br />"
        f = `#{cmd} 2>&1`
        if $verbose
          file.puts f
        else
          file.puts f.gsub(/\n\e.*$/, '')
        end
        file.puts '</td>'
      end
      file.puts '</tr>'
    end
    file.puts '</table></body>'
    `open seige_output.html`
  end
end
