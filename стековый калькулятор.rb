#encoding: utf-8

class RecursComp
  def compile(str)
    @str,@index = str,0
    compileF
  end
  
  #private

  def compileF
    compileT
    return if @index >= @str.length
    cur = @str[@index].chr
    cur_next = @str[@index+1].chr
    if (cur == '/' and cur_next == '/') or (cur == '/' and cur_next == '*')
      @index += 2
      compileK
      @index += 2
    end
    if cur == '+' or cur == '-'
      @index += 1
      compileF
      print "#{cur} "
    end
  end
  def compileT
    compileM
    return if @index >= @str.length
    cur = @str[@index].chr
    after_cur = @str[@index+1].chr
    if cur == '*' or cur == '/' or cur =='%'
      @index += 1
      compileT
      print "#{cur} "
    end
  end
  def compileM
    if @str[@index].chr == '(' or @str[@index].chr == '{' or @str[@index].chr == '['
      @index += 1
      compileF
      @index += 1
    else
      compileV
    end
  end
  def compileK
    while not(@str[@index].chr == '/' and @str[@index+1].chr == '/') and not(@str[@index].chr == '*' and @str[@index+1].chr == '/')
        @index += 1
    end
  end
  def compileV
    print "#{@str[@index].chr} "
    @index += 1
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
𝐹 → 𝑇 | 𝑇 + 𝐹 | 𝑇 − 𝐹 | //K// | /*K*/
𝑇 → 𝑀 | 𝑀 * 𝑇 | 𝑀/𝑇
𝑀 → (𝐹) | 𝑉 | K
𝑉 → 𝑎 | 𝑏 | . . . | z
K → k
=end

