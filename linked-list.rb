# Quick Example of a Self Referential Data Structure in Ruby
# NODE -> contains a value and a pointer to (next_node)
# LinkedList -> This class holds the linked list functions - adding a node, traversing and displaying the linked list

class Node
   attr_accessor :value, :next_node

   def initialize(val,next_in_line=nil)
     @value = val
     @next_node = next_in_line
     #puts "Initialized a Node with value:  " + value.to_s
   end
end

class LinkedList
   def initialize
     @head = nil
     @size = 0
   end

   def add(value)
       if @size == 0
           @head = Node.new(value,nil)
           @size += 1
         else
         # Traverse to the end of the list
         # And insert a new node over there with the specified value
         current = @head
           while current.next_node != nil
               current = current.next_node
           end
         current.next_node = Node.new(value,nil)
         @size += 1
       end
       self
   end

   def delete(val)
       return nil if @size == 0
       if @head.value == val
           # If the head is the element to be delete, the head needs to be updated
           @head = @head.next_node
           @size -= 1
       else
           # ... x -> y -> z
           # Suppose y is the value to be deleted, you need to reshape the above list to :
           #   ... x->z
           previous = @head
           current = @head.next_node
           while current != nil && current.value != val
               previous = current
               current = current.next_node
           end

           if current != nil
               previous.next_node = current.next_node
               @size -= 1
           end
       end
   end

   def display
       # Traverse through the list till you hit the "nil" at the end
       current = @head
       full_list = []
       while current.next_node != nil
           full_list += [current.value.to_s]
           current = current.next_node
       end
       full_list += [current.value.to_s]
       puts "===" + full_list.join("->") + "==="
   end

   def include?(key)
     current = @head
     while current != nil
       return true if current.value == key
       current = current.next_node
     end
     return false
   end

   def size
     return @size
   end

   def max
     return nil if @size == 0
     max = @head.value
     current = @head.next_node
     while current != nil
       if current.value > max
         max = current.value
       end
       current = current.next_node
     end
     return max
   end

   def sort
     # ;_;
   end

   def reverse
    current = @head
    next_node = @head.next_node
    prev_node = nil

    while current != nil #until you reach the last node
      next_node = current.next_node
      current.next_node = prev_node
      prev_node = current
      current = next_node
    end

    @head = prev_node

    #loop through entire linked list

    #establish pointers: current, next_node, prev_node
        #current=@head
        #next_node=@head.next_node
        #prev_node=nil

    # start at head (current)
      # next_node should point at current.next_node... so we remember which node comes next after changing the connection
      # change the connection, current.next_node should now equal prev_node, so it "points backwards"
      # prev_node should point at current... because we are able to change the current pointer to move on to the next item
      # current = next_node.
    # repeat the above process until current = nil, because that means we have reached the end of the list
    # establish the last node as the new head 
   end

end
