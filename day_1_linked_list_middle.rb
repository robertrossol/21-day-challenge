
  # You may assume the node class is:
  # class LLNode {
  #   constructor(value, next = null) {
  #     this.value = value;
  #     this.next = next;
  #   }
  # }
  

# Steps:
# 1: Determine Length of Linked List/determine index of middle node
# 2: Update 'next' attribute of previous node to skip over middle node

class Node
    
  attr_accessor :data, :next

  def initialize(data, next_node = nil)
    @data = data
    @next = next_node
  end
end

class LinkedList
  def initialize(head)
    @head = Node.new(head)
  end

  def is_empty?
    return true if @head.nil?

    false
  end

  def push(data)
    if is_empty?
      @head = Node.new(data)
    else
      current_node = @head
      new_node = Node.new(data)
      current_node = current_node.next until current_node.next.nil? #or: current_node = current_node.next while !current_node.next.nil?
      current_node.next = new_node
    end
  end

  def length
    if self.is_empty?
      size = 0
    else
      size = 1
      current_node = @head
      while !current_node.next.nil?
        size += 1
        current_node = current_node.next
      end
    end
    size
  end

  def second_to_middle_node(head, size)
    index = 1
    while index < (size / 2)
      head = head.next
      index += 1
    end
    head
  end

  def delete_middle_node
    node = second_to_middle_node(@head, length)
    node.next = node.next.next
  end

  def pretty_print
    array = []
    current_node = @head
    return array if is_empty?

    until current_node.next.nil?
      array << current_node.data
      current_node = current_node.next
    end
    array << current_node.data
    array
  end

  def clear
    @head = nil
  end
end

x = LinkedList.new(5)
x.push(7)
x.push(12)
x.push(4)
x.push(16)
x.push(456)
x.push(11)
x.push(12)
x.push(22)
x.delete_middle_node

p x.pretty_print
p x.length

x.clear
p x.length
p x.pretty_print
