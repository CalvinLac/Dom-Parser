require_relative 'warmup2'

class Searcher

	def initialize(tree)
		@tree=tree
		@cursor = tree.root

	end

	def dfs(attribute,value)
		dfs_array = []
		dfs_array << @cursor

		while !dfs_array.empty? 
			checker = dfs_array.pop
			puts checker
			if attribute=="class"
				if checker.class==value
					put "You have found it"
					return checker
				end
			else
					checker.children.each do |child_of_child|
						dfs_array << child_of_child
			end
		end
	end
end





end



tree = Reader.new

searcher = Searcher.new(tree)
puts searcher.dfs('class', 'class=["top-div"]')