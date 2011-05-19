require 'digest/md5'
require 'digest/sha2'

class DataObject
  attr_accessor :next, :value, :hash_key
  
  def initialize(v, n=nil)
    @value = v
    @next = n
    @hash_key = Digest::SHA2.hexdigest(Time.now.to_s + v.to_s + rand(2**256).to_s(36).ljust(8, 'a')[0..7])
  end
end

class LinkedList
  
  attr_accessor :head

  def add(value)
    if @head.nil?
      @head = DataObject.new(value)
    else
      insertNext(head, value)
    end
  end

  def insertNext(node, value)
    if node.next.nil?
      node.next = DataObject.new(value)
    else
      insertNext(node.next, value)
    end
  end

  def insertBeforeHead(value)
    @head = DataObject.new(value, @head)
  end

  def insertAfter(key, value, node=nil)
    if node.nil?
      insertAfter(key, value, @head)
    else
      if node.hash_key == key
        new_node = DataObject.new(value, node.next)
        node.next = new_node
      else
        insertAfter(key, value, node.next)
      end
    end
  end

  def insertBefore(key, value)
    if @head.hash_key == key
      insertBeforeHead(value)
    else
      
    end
  end

  def inspect
    printNextNode(@head)
  end

  def printNextNode(node)
    if node.nil?
      return
    else
      p "#{node.value} #{node.hash_key}"
      printNextNode(node.next)
    end
  end

  def remove(key)
    if @head.hash_key == key
      @head = @head.next
    else
      removeKey(key, @head)
    end
  end
  
  def removeKey(key, node)
    if node.next.hash_key == key
      node.next = node.next.next
    else
      removeKey(key, node.next)
    end
  end
end

l = LinkedList.new
l.add(5)
l.add(7)
l.add(9)
l.insertBeforeHead(10)
l.add(12)
