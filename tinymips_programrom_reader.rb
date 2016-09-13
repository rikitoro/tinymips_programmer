require 'rubygems'
require 'serialport'


def isEOF(str)
  str =~ /:[0-9a-fA-F]{6}01[0-9a-fA-F]*/
end

commands =[]
if (ARGV.size != 1)
  puts "usage:"
  puts "$ bundle exec ruby tinymips_programrom_reader.rb <port_name>"
  puts "example:"
  puts "$ bundle exec ruby tinymips_programrom_reader.rb /dev/ttyS2"

  exit()
end

port_name = ARGV[0]

SerialPort.open(
  port_name,
  baud: 9600 ,
  data_bits: 8,
  stop_bits: 1#,
  #parity: 0 #SerialPort::NONE
  ) do |sp|

  sp.read_timeout = 1000
  #sp.gets("\r\n")

  [ "RI:200000",
    "RI:200020",
    "RI:200040",
    "RI:200060",
    "RI:200080",
    "RI:2000A0",
    "RI:2000C0",
    "RI:2000E0",
    "RI:200100",
    "RI:200120",
    "RI:200140",
    "RI:200160",
    "RI:200180",
    "RI:2001A0",
    "RI:2001C0",
    "RI:2001E0",
    "RI:200200",
    "RI:200220",
    "RI:200240",
    "RI:200260",
    "RI:200280",
    "RI:2002A0",
    "RI:2002C0",
    "RI:2002E0",
    "RI:200300",
    "RI:200320",
    "RI:200340",
    "RI:200360",
    "RI:200380",
    "RI:2003A0",
    "RI:2003C0",
    "RI:2003E0"
  ].each { |line|
    #puts line
    sp.puts line
    puts sp.gets("\r\n")
  }
  puts ':00000001FF'
end