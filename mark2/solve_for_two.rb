def box_finished?(box)
  box == box.flatten
end



def solve_for_twos(array, rows, columns, location, section)
  clear_all(array)
  #p @loop_once

  total_numbers_remaining?(array).each do |number|
    rows.each do |row|
      temp_array = []
      temp_location = []

      columns.each do |column|
        #if rows.include?(row) && columns.include?(column)

          element = array[row][column]
          temp_location << [row, column]
          temp_array << element

          if (temp_array.size % 9) == 0
            temp_array.each_with_index do |element, index|
              if ((element.size == 2) && element.include?(number)) && (@loop_once == 0)
                if temp_array.count(element) == 2
                  #p temp_location


                  pair = element
                  r = temp_location[index][0]
                  c = temp_location[index][1]

                  new_value = pair[0]
                  array[r][c] = new_value

                  temp_array.each_with_index do |arr, index|
                    unless arr.is_a?(Integer)
                      unless arr == element
                        r = temp_location[index][0]
                        c = temp_location[index][1]
                       array[r][c] -= pair
                      end
                    end
                  end
                  save_history(location, row, column, element, new_value, :solve_for__pair, :matching_pair)

                  @loop_once = 1
                  clear_all(array)
                  return

                else

                  #if box_finished?(@box2)

                    #p "row: #{row} col: #{column}"

                    r = temp_location[index][0]
                    c = temp_location[index][1]
                    new_value = number
                    array[r][c] = new_value 
                    save_history(location, row, column, element, new_value, :solve_for_two__, "*** guess ***")
                    @loop_once = 1
                    clear_all(array)
                    return

                  # end

                end
              end
            end
          end
        #end
      end
      temp_array = []
      temp_location = [] 
    end
  end
end
