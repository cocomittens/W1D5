require "byebug"

class PolyTreeNode
  attr_reader :parent, :children
  def initialize(value)
    @parent, @children, @value = nil, [], value
  end

  def parent 
    @parent
  end

  def children 
    @children
  end

  def value 
    @value
  end

  def parent=(node)
    parent.children.reject! {|el| el == self}  unless parent == nil
    @parent = node
    parent.children << self unless parent == nil || parent.children.include?(self)
  end

   def add_child(child)
    children << child unless children.include?(child)
    child.parent = self
   end

   def remove_child(child)
    raise "Not a child" if !children.include?(child)
    child.parent = nil
  end

  def dfs(target)
    return self if target == self.value
    unless children.empty?
      children.each do |child|
        child.dfs(target)
      end
    end
    nil
  end

end

