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
    return @depth
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
    return @depth
  end

  def include?(score)
    if self.root == nil 
      return false
    end
    node = self.root
    if node.score == score 
      return true
    else
      next_include?(node, score) 
    end
  end

  def next_include?(node, score)
    if node.score < score 
      if node.right.nil? 
        return false
      else
        node = node.right
        next_include?(node, score) 
      end
    elsif node.score > score 
      if node.left.nil? 
        return false
      else
        node = node.left
        next_include?(node, score) 
      end
    elsif node.score == score
      return true
    end
  end

  def depth_of(score)
    if self.root == nil
      return nil
    end
    node = self.root
    @depth = 0
    if node.score != score
			@depth += 1
		end
    return @depth
  end
end