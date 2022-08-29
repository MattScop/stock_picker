=begin 
1. Define a method stock_picker(price_array)
2. Iterate over the price_array. For each value, iterate over the other values by doing value[i+1] - value[i] and store the everything in a temp array.
3. Grab the max from the temp array and return an array containing the value[i] and the value[i+1]
=end

# 1.
def stock_picker(array)
    # 2.
    price_list = []
    array.each_with_index do |price, idx|
        while idx < array.length-1
            price_list << [price, array[idx+1], array[idx+1] - price]
            idx+=1
        end
    end
    # 3.
    profit_list = []
    price_list.each do |sets| 
        profit_list << sets.last #grab only the profit result
    end
    highest_profit_set = price_list.select {|sets| sets[2] == profit_list.max}.flatten[0..1]
    best_days = []
    highest_profit_set.each do |day|
        best_days << array.find_index(day)
    end
    print best_days
end

stock_picker([17,3,6,9,15,8,6,1,10])