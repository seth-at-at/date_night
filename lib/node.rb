class Node
  attr_accessor :left, :right, :score, :title
  def initialize(score, title)
    @score = score
    @title = title
  end
end