def command_1(bank_5, bank_10, bank_50, bank_100)
    puts "'5': #{bank_5},   "+ "'10': #{bank_10},   "+ "'50': #{bank_50},   "+ "'100': #{bank_100}."
end

def command_2(bank_5, bank_10, bank_50, bank_100)
    puts "Enter a denomination of 5, 10, 50 or 100 rubles."
    plus = gets.to_i

    list = [bank_5, bank_10, bank_50, bank_100].map {|i| i.to_i}
    bank_5, bank_10, bank_50, bank_100 = list

    if plus == 5
        bank_5 += 1
    elsif plus == 10
        bank_10 += 1
    elsif plus == 50
        bank_50 += 1
    elsif plus == 100
        bank_50 += 1
    else
        puts "Invalid data."
    end 
    list = [bank_5, bank_10, bank_50, bank_100]
    return list #list.map {|i| i.to_s}
end

def command_3(bank_5, bank_10, bank_50, bank_100)
    list = [bank_5, bank_10, bank_50, bank_100].map {|i| i.to_i}
    bank_5, bank_10, bank_50, bank_100 = list

    puts "Enter a multiple of five."
    minus = gets.to_i
    issued = []
    if minus % 5 != 0
        puts "Invalid data."
    elsif minus > (bank_5*5 + bank_10*10 + bank_50*50 + bank_100*100)
        puts "There are not enough funds on the balance."
    else
        flag = 1
        while (minus > 0) && (flag == 1)
            if (minus / 100 > 0) && (bank_100 > 0)
                issued << "4"
                minus -= 100
            elsif (minus / 50 > 0) && (bank_50 > 0)
                issued << "3"
                minus -= 50
            elsif (minus / 10 > 0) && (bank_10 > 0)
                issued << "2"
                minus -= 10
            elsif (minus / 5 > 0) && (bank_5 > 0)
                issued << "1"
                minus -= 5
            else
                flag = 0
            end
        end
        if flag == 0 && minus > 0
            puts "There are not enough bills in the ATM to dispense the required amount without change."
        else
            num_banknotes_5 = issued.count('1')
            num_banknotes_10 = issued.count('2')
            num_banknotes_50 = issued.count('3')
            num_banknotes_100 = issued.count('4')

            if num_banknotes_5 > 0
                puts "Issued #{num_banknotes_5} banknotes with a face value of 5 rubles."
                bank_5 -= num_banknotes_5
            end
            if num_banknotes_10 > 0
                puts "Issued #{num_banknotes_10} banknotes with a face value of 10 rubles."
                bank_10 -= num_banknotes_10
            end
            if num_banknotes_50 > 0
                puts "Issued #{num_banknotes_50} banknotes with a face value of 50 rubles."
                bank_50 -= num_banknotes_50
            end
            if num_banknotes_100 > 0
                puts "Issued #{num_banknotes_100} banknotes with a face value of 100 rubles."
                bank_100 -= num_banknotes_100
            end
            list = [bank_5, bank_10, bank_50, bank_100]
            return list
        end
    end
end

puts "Enter the number of banknotes in denominations of 5, 10, 50 and 100 rubles."
input = gets
bank_5, bank_10, bank_50, bank_100 = input.split(' ')
while true
    puts "Enter 1 to view balance."
    puts "Enter 2 to deposit cash."
    puts "Enter 3 to withdraw cash."
    request = gets.to_i
    if request == 1
        command_1(bank_5, bank_10, bank_50, bank_100)
    elsif request == 2
        bank_5, bank_10, bank_50, bank_100 = command_2(bank_5, bank_10, bank_50, bank_100)
        puts "The balance has been successfully replenished."
    elsif request == 3
        bank_5, bank_10, bank_50, bank_100 = command_3(bank_5, bank_10, bank_50, bank_100)
    else
        raise "Invalid request."
    end
end