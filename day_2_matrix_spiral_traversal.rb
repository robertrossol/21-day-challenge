# Given a 2D rectangular matrix, return all of the values in a single, 
# linear array in spiral order. Start at (0, 0) and first include 
# everything in the first row. Then down the last column, back the last row (in reverse), 
# and finally up the first column before turning right and continuing into the interior of the matrix.

def spiralTraversal(matrix)
  
  solution = []
  step = 0

  until matrix.empty?
    solution <<
      case step % 4
      when 0
        matrix.shift
      when 1
        matrix.pop
      when 2
        matrix.pop.reverse
      else
        matrix.shift.reverse
      end
    matrix = matrix.transpose
    step += 1
  end
  solution.flatten
end

matrix = [
  [1, 2, 3, 4],
  [5, 6, 7, 8],
  [9, 10, 11, 12],
  [13, 14, 15, 16]
]

p spiralTraversal(matrix)

# 1: matrix.shift (first)
#    matrix = matrix.transpose
# 2: matrix.pop (last)
#    matrix = matrix.transpose
# 3: matrix.pop.reverse (last reversed)
#    matrix = matrix.transpose
# 4: matrix.shift.reverse (first reversed)
#    matrix = matrix.transpose
