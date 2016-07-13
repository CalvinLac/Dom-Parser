require_relative 'warmup2'

class Searcher
  def initialize(tree)
  	@tree=tree
  	@cursor=tree.root
  end

  def dfs(attribute,value)
  	dfs_array=[]
  	dfs_array<<@cursor

	while !dfs_array.empty?
	  checker=dfs_array.pop
	  unless checker.class.nil?
	  	if attribute=="class" && checker.class.include?(value)
	  		puts "Found #{value}"
		end

	  unless checker.class.nil?
	  	if attribute=="tag" && checker.tag.include?(value)
	  		puts "Found #{value}"
		end
	   end

	   unless checker.id.nil?
          if attribute=="id" && checker.id.include?(value)
           puts "Found #{value}"
          end
        end

       unless checker.text.nil?
         if attribute=="text" && checker.text.include?(value)
         	puts "Found #{value}"
         end
       end

	end

	  	checker.children.each do |child_of_child|
	  		dfs_array<<child_of_child
	  	end
	end

  end

end

tree=Reader.new
searcher=Searcher.new(tree)
searcher.dfs("class","inner-div")
searcher.dfs("tag", "div")
searcher.dfs("text", "EVEN")