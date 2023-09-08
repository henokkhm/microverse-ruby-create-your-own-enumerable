require_relative 'enumerable'

class MyList
  include MyEnumerable

  def initialize(*items)
    @list = items
  end

  def each
    return to_enum(:each) unless block_given?

    i = 0
    while i < @list.size
      yield(@list[i])
      i += 1
    end
  end
end

list = MyList.new(1, 2, 3, 4)
puts(list.all? { |e| e < 5 })
puts(list.all? { |e| e > 5 })
puts(list.any? { |e| e == 2 })
puts(list.any? { |e| e == 5 })
puts(list.filter(&:even?))
