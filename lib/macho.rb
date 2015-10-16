require "#{File.dirname(__FILE__)}/cstruct"
require "#{File.dirname(__FILE__)}/macho/headers"
require "#{File.dirname(__FILE__)}/macho/structure"
require "#{File.dirname(__FILE__)}/macho/load_commands"
require "#{File.dirname(__FILE__)}/macho/sections"
require "#{File.dirname(__FILE__)}/macho/macho_file"
require "#{File.dirname(__FILE__)}/macho/fat_file"
require "#{File.dirname(__FILE__)}/macho/exceptions"
require "#{File.dirname(__FILE__)}/macho/utils"
require "#{File.dirname(__FILE__)}/macho/tools"

module MachO
	def self.open(filename)
		# open file and test magic instead of using exceptions for control?
		begin
			file = MachOFile.new(filename)
		rescue FatBinaryError
			file = FatFile.new(filename)
		end

		file
	end
end
