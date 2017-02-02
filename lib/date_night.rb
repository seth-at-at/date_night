require_relative'node.rb'

class BinarySearchTree
  attr_accessor :root

  def insert(score, title)
    new_node = Node.new(score, title)
    @depth = 0
    root.nil? ? @root = new_node : compare_location(root, new_node)
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
    return false if root.nil?

    root.score == score ? true : next_include?(root, score)
  end

  def next_include?(node, score)
    if node.score < score 
      node.right.nil? ? false : node = node.right
        next_include?(node, score) 
    elsif node.score > score 

      node.left.nil? ? false : node = node.left
        next_include?(node, score) 

    elsif node.score == score
      true
    end
  end

  def depth_of(score)
    nil if root == nil

    node = root
    @depth = 0

    if node.score != score
     @depth += 1
    end
    @depth
  end

  def max
    traverse(:right)
  end

  def min
    traverse(:left)
  end

  private

  def traverse(direction)
    return nil if root.nil?
    node = root
    until node.send(direction).nil?
      node = node.send(direction)
    end
    { node.title => node.score }
  end

  # def traverse_location(direction)
  #   if node.score < score 
  #     if node.direction.nil? 
  #       false
  #     else
  #       node = node.direction
  #       next_include?(node, score) 
  #     end
  #   elsif node.score > score 
  #     if node.direction.nil? 
  #       false
  #     else
  #       node = node.direction
  #       next_include?(node, score) 
  #     end
  #   elsif node.score == score
  #     true
  #   end
  # end
end