# Insertion Sort
def insertion_sort(sequence=[18,2,556,56,34,3,56,6,9,54,72,100])

  sorted_array = sequence[0]                        # [18]
  unsorted_array = sequence[1..sequence.size]       # [2,556,56,34,3,56,6,9,54,72,100]

  unsorted_array.each_with_index do |elem, index|
    sequence[0..index].reverse.each do |k|
      break unless k > elem
      sequence[index + 1] = k
      sequence[index] = elem
      index = index - 1
    end
    sequence[index + 1] = elem
  end
end

insertion_sort

# Merge Sort
def merge_sort(list)
  return list if list.size <= 1
  mid = list.size / 2
  left  = list[0, mid]
  right = list[mid, list.size]
  merge(merge_sort(left), merge_sort(right))
end

def merge(left, right)
  sorted = []
  until left.empty? or right.empty?
    if left.first <= right.first
      sorted << left.shift
    else
      sorted << right.shift
    end
  end
  sorted.concat(left).concat(right)
end