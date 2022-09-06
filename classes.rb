class Dog
    def talk
        puts "Bark!"
    end
    def move(destantion)
        puts "Runnning to the #{distantion}."
    end
end

class Cat  
    def talk 
        puts "Meoow!"
    end
    def move(destantion)
        puts "Runnning to the #{destantion}."
    end
end

Sharic = Dog.new
Barsic = Cat.new

Sharic.talk
Barsic.move("kitchen")
