

def count(int,int2)
	return if int > int2
	puts int
	int += 1
	count(int,int2)
end

puts count(5,25)

def count1(start, stop)
	start.upto(stop) do |i|
		puts i
	end
end

puts count1(5,100)