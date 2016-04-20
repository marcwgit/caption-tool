#!/usr/bin/ruby

require 'rubygems'
#require 'roo'
#require 'nokogiri'
require 'open-uri'

aud_file = "Tue-Mar-22-02-51PMGroupB-4.m4a"
source_name = "source.txt"
dest_name = "dest.txt"
# file created for demonstration purposes
# mw File.open(source_name, 'w'){|f| f.write("Hello text file 1234")}

# copy file using your system's command line:
# mw shell_output = `cp #{source_name} #{dest_name}`
shell_output = `fish playtimesec #{source_name}`
print shell_output

# Here, I make the mistake of expecting shell_output to hold the
# destination file's name. But again, it holds *nothing*
#File.open(shell_output, 'r'){|f| puts f.read}
