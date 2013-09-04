class Tree
  attr_accessor :children, :node_name
  
  def initialize(name, children=[])
    @children = children
    @node_name = name
  end
  
  def visit_all(&block)
    visit &block
    children.each { |c| c.visit_all &block}
  end
  
  def visit(&block)
    block.call self
  end
end

class Tree2
  attr_accessor :children, :node_name
  
  def initialize(treeData)
    @node_name = treeData.keys[0]
    @children = []
    
    treeData[@node_name].each do |key, value|
      @children.push(Tree2.new({key => value}))
    end
    
  end
  
  def visit_all(&block)
    visit &block
    children.each { |c| c.visit_all &block}
  end
  
  def visit(&block)
    block.call self
  end
end

ruby_tree = Tree.new("Ruby", [Tree.new("Reia"), Tree.new("MacRuby")])

puts "Visiting a node"
ruby_tree.visit { |node| puts node.node_name }

puts "Visiting entire tree"
ruby_tree.visit_all { |node| puts node.node_name }

puts "*******Second version of tree*******"

ruby_tree2 = Tree2.new({"Ruby" => {"Reia" => {}, "MacRuby" => {}}})

puts "Visiting a node"
ruby_tree2.visit { |node| puts node.node_name }

puts "Visiting entire tree"
ruby_tree2.visit_all { |node| puts node.node_name }