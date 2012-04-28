class BidGrokk
  def main (servers, bids)
    #puts "servers = #{servers}, bids = #{bids}"
    target_bid, max_bling = find_max_area servers, bids
    puts "target bid = #{target_bid}, max bling = #{max_bling}"
  end

  def find_best_bid (servers, bids)
    find_max_area servers, bids
  end

  def find_max_area (length, y_values)
    max_area, target_height = 0, 0

    y_values.each_with_index { |height, i|
      width = [i+1, length].min
      current_area = height * width

      if current_area > max_area
        max_area = current_area
        target_height = height
      end
    }

    [target_height, max_area]
  end
end