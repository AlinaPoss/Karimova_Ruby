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
    str_1 = matrix1.length
    column_1 = matrix1[0].length
    str_2 = matrix2.length
    column_2 = matrix2[0].length
    puts("#{str_1} #{column_1} #{str_2} #{column_2}")

    if column_1 == str_2
        norm_size = 1
    else
        norm_size = 0
    end

    final_matrix = []
    i = 0
    while i < str_1 && norm_size = 1
        current_line = []
        k = 0
        while k < column_2
            p = 0
            current_summ = 0
            while p < str_2
                current_summ += (matrix1[i][p]*matrix2[p][k])
                #puts("#{i} #{p} #{p} #{k}")
                p += 1
            end
            k = k + 1
            current_line.push(current_summ)
        end
        final_matrix.push(current_line)
        i += 1
    end
    return final_matrix
end

lines = []
puts "Ведите в текстовый файл две матрицы. 
Необходимо, чтобы количество столбцов в первой матрице совпадало с количеством строк во второй."
File.open('data.txt') do |review|
    lines = review.readlines
end
matrix1, matrix2 = filling(lines)
final_matrix =  multiplication(matrix1, matrix2)

pos = 0
puts('Произведение матриц:')
while pos < final_matrix.length
    puts multiplication(matrix1, matrix2)[pos].join(" ")
    pos += 1
end