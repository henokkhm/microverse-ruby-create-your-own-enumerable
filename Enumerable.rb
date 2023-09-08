module MyEnumerable
    def all?(&element)
        each { |item| return false unless element.call(item) }
        true
      end
    
      def any?(&element)
        each { |item| return true if element.call(item) }
        false
      end
    
      def filter(&element)
        result = []
        each { |item| result << item if element.call(item) }
        result
      end
end