Attributes = Struct.new(:classes, :id, :name)


class Parser

	def initialize
		@html_array = File.readlines('warmuphtml.html')
		@class = []
		@id = []
		@html_array.each do |line|
			exact_match(line)
		end
	end


	def exact_match (tag)
		attributes = Attributes.new

		#for class 
		if tag.include?('class=')
			matching_class1 = tag.match (/class=['"](.+?)['"]/)
			attributes.classes << matching_class1.captures[0].split(" ")
		end

		#for id
		if tag.include?('id=')
			matching_class2 = tag.match (/id=['"](.+?)['"]/)
			@attributes.id << matching_class2.captures[0].split(" ")
		end


	end

end

p = Parser.new
