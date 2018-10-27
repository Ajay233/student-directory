def some_method(num)
  result = num * num
  result
end

File.open(__FILE__) do |file|
  file.readlines.each do |line| 
    print line  
  end
end