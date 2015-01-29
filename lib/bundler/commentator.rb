require 'gems'
require 'commander'

module Bundler
  class Commentator
    include Commander::Methods

    def run
      program :name, 'bundler-commentator'
      program :version, '1.0.0'
      program :description, 'Comment your Gemfile with descriptions from RubyGems.org'

      command :comment do |c|
        c.syntax = '[options]'
        c.description = 'comments Gemfile'
        c.option '--gemfile_path STRING', String, 'Path to Gemfile'
        c.option '--output_path STRING', String, 'Output Path'

        c.action do |args, options|
          options.default gemfile_path: 'Gemfile', output_path: 'Gemfile'
          say "Reading Gemfile: #{options.gemfile_path}"
          begin
            open(options.gemfile_path)
          rescue
            raise RuntimeError, 'Error opening Gemfile'
            exit
          end
          output_buffer = ''
          File.open(options.gemfile_path "r") do |f|
            f.each_line do |line|
              begin
                if (gem = instance_eval line)
                  if !(description = get_description(gem)).empty?
                    indentation = line[/\A */]
                    output_buffer << "\n#{wrap(description,indentation)}"
                  end
                end
              rescue Exception
              end
              output_buffer << line
            end
          end
          say "Writing commented Gemfile to: #{options.output_path}"
          File.open(options.output_path, 'w') {|file| file.write(output_buffer)}
        end

      end

      default_command :comment
      run!
    end

    def get_description(*args)
      rubygems_info = Gems.info args[0].to_s
      rubygems_info["info"].chomp
    end

    def wrap(s, indentation="", width=78)
      s.gsub(/(.{1,#{width-indentation.size}})(\s+|\Z)/, "#{indentation}# \\1\n")
    end

    private

    def gem(*args)
      args[0]
    end
  end
end
