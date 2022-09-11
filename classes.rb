class Dog
    attr_reader :name, :age

    def name=(value)
        if value == ""
            raise "Error!!"
        end
        @name = value
    end
    
    def age=(value)
        if value < 0
            raise "Error!!"
        end
        @age = value
    end
            
    def report_age
        puts "#{@name} is #{@age} years old."
    end

    def talk
        puts "#{@name} says Bark!"
    end

    def move(distantion='home')
        puts "Runnning to the #{distantion}."
    end
end

sharic = Dog.new

#sharic.talk
sharic.name = "Sh"
sharic.report_age
sharic.move
puts sharic.name