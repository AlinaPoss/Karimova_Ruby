def filling(lines)
    matrix1 = []
    matrix2 = []
    place = 1 # "место", в которое мы добавляем элементы (1-ая или 2-ая матрица)
    lines.each do |line|
        if line[0].to_s == "a" # символ "а" выступает разделителем ввода двух матриц
            place += 1
        elsif place % 2 == 1
            matrix1.push(line.split.map{ |numb| numb.to_i })
        else
            matrix2.push(line.split.map{ |numb| numb.to_i })
        end
    end
    return matrix1, matrix2
end

def multiplication(matrix1, matrix2)
    str = matrix1.length
    column = matrix1[1].length
    final_matrix = []
    i = 0
    while i < str
        current_line = []
        k = 0
        while k < column
            current_number = matrix1[i][k]*matrix2[i][k]
            current_line.push(current_number)
            k += 1
        end
        final_matrix.push(current_line)
        i += 1
    end
    return final_matrix
end

lines = []
File.open('data.txt') do |review|
    lines = review.readlines
end
matrix1, matrix2 = filling(lines)
final_matrix =  multiplication(matrix1, matrix2)
pos = 0
while pos < final_matrix.length
    puts multiplication(matrix1, matrix2)[pos].join(" ")
    pos += 1
end