require_relative'node.rb'

class BinarySearchTree
	attr_accessor :root
	def initialize 
		@root = root
	end

	def insert(score, title)
		new_node = Node.new(score, title)
		@depth = 0
			if self.root.nil?
				self.root = new_node
			else
				self.compare_location(self.root, new_node) 
			end
		@depth
	end

	def compare_location(node_1, node_2)
		@depth += 1 
		if node_2.score < node_1.score 
			if node_1.left.nil? 
				node_1.left = node_2
			else
				compare_location(node_1.left,node_2) 
			end
		else
			if node_1.right.nil? 
				node_1.right = node_2 
			else
				compare_location(node_1.right, node_2) 
			end
		end
		@depth
	end

	def include?(score)
		if self.root == nil 
			false
		end
			node = self.root
		if node.score == score 
			true
		else
			next_include?(node, score) 
		end
	end

	def next_include?(node, score)
		if node.score < score 
			if node.right.nil? 
				false
			else
				node = node.right
				next_include?(node, score) 
			end
		elsif node.score > score 
			if node.left.nil? 
				false
			else
				node = node.left
				next_include?(node, score) 
			end
		elsif node.score == score
			true
		end
	end

	def depth_of(score)
		if self.root == nil
			nil
		end
			node = self.root
			@depth = 0
		if node.score != score
			@depth += 1
		end
			@depth
	end
end