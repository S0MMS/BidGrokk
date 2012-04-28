class BidGrokk

  # Consider servers as max length and bids as a sequence of decreasing y values,
  # then finding target bid that yields max money is equivalent to finding target y that yields max area.
  def main (servers, bids)
    target_bid, max_bling = find_max_area servers, bids
    puts "target bid = #{target_bid}, max bling = #{max_bling}"
  end

  # Given max length and decreasing y values, find rectangle with maximum area. Time complexity = O(n).
  def find_max_area (max_length, y_values)
    max_area, target_y = 0, 0

    y_values.each_with_index { |height, i|
      width = [i+1, max_length].min
      current_area = height * width

      if current_area > max_area
        max_area = current_area
        target_y = height
      end
    }

    [target_y, max_area]
  end

end