#encoding: utf-8

class RecursComp
  def compile(str)
    @str,@index = str,0
    compileF
  end
  
  #private

  def compileF
    #print "f#{@index}f"
    compileK
    compileT
    return if @index >= @str.length
    cur = @str[@index].chr
    #print "#{cur} p\n"
    if cur == '+' or cur == '-'
      @index += 1
      compileF
      print "#{cur} "
    end
    compileK
  end
  def compileT
    #print "t#{@index}t"
    compileK
    compileM
    return if @index >= @str.length
    cur = @str[@index].chr
    if cur == '*' or cur == '/' or cur =='%'
        @index += 1
        compileT
        print "#{cur} "
    end
  end
  def compileM
    #print "m#{@index}m"
    compileK
    cur = @str[@index].chr
    if @str[@index].chr == '(' or @str[@index].chr == '{' or @str[@index].chr == '['
      @index += 1
      compileF
      @index += 1
    else
      compileV
    end
  end
  def compileK
    #print "k#{@index}k"
    return if @index >= @str.length
    if (@str[@index].chr == '/' and @str[@index+1].chr == '/') or (@str[@index].chr == '/' and @str[@index+1].chr == '*')
        @index += 2
        while not(@str[@index-1].chr == '/' and @str[@index].chr == '/') and not(@str[@index-1].chr == '*' and @str[@index].chr == '/')
            @index += 1
            #print "i#{@index}i"
        end
        @index += 1
    end
  end
  def compileV
    print "#{@str[@index].chr} "
    @index += 1
    if @index < @str.length 
        compileK
    end
  end
end

c = RecursComp.new
while true
  print "Введите формулу: "
  str = readline.chomp.delete(' ')
  c.compile(str) #without \n
  print "\n"
end

=begin
𝐹 → 𝑇 | 𝑇 + 𝐹 | 𝑇 − 𝐹 | //K//F | 
....................... 
𝑇 → 𝑀 | 𝑀 * 𝑇 | 𝑀/𝑇
𝑀 → (𝐹) | 𝑉 | K 
𝑉 → 𝑎 | 𝑏 | . . . | z | V//K//
K → 
=end

