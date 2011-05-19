class BST
 attr_accessor :root

 def initialize
   root = nil
 end

 def insert(value)
   if @root == nil
     @root = DataObject.new(value)
   else
     insertNode(root, value)
   end
 end

 def insertNode(node, value)
   if value > node.value
     if node.right.nil?
	node.right = DataObject.new(value)
     else
        insertNode(node.right, value)
     end
   else
     if node.left.nil?
	node.left = DataObject.new(value)
     else
        insertNode(node.left, value)
     end
   end 
 end

 def inorder
   sortInOrder(root)
 end

 def sortInOrder(node)
   sortInOrder(node.left) unless node.left.nil?
   p node.value
   sortInOrder(node.right) unless node.right.nil?
 end

 def preorder
   sortPreOrder(root)
 end

 def sortPreOrder(node)
   p node.value
   sortPreOrder(node.left) unless node.left.nil?
   sortPreOrder(node.right) unless node.right.nil?
 end

 def postorder
   sortPostOrder(root)
 end

 def sortPostOrder(node)
   sortPostOrder(node.left) unless node.left.nil?
   sortPostOrder(node.right) unless node.right.nil?
   p node.value
 end
end

class DataObject
 attr_accessor :left
 attr_accessor :right
 attr_accessor :value

 def initialize(value)
   @left = nil
   @right = nil
   @value = value
 end
end

m = BST.new
m.insert(10)
m.insert(5)
m.insert(4)
m.insert(7)
m.insert(2)
m.insert(15)
m.insert(17)
m.insert(16)
