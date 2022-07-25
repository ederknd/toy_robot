require_relative 'src/cli'

args = ARGV
mode = args[0]
file_path = args[1]

if mode == '-f' && file_path
  cli = CLI.new(File.open(file_path))
  cli.start
end