def consolidate_cart(cart)
  # code here
  return_hash = {}
  cart.each do |hash|
    hash.each do |item, attributes|
      if return_hash[item]
        return_hash[item][:count] += 1
      
      else
        return_hash[item] = attributes
        return_hash[item][:count] = 1
      end
    end
  end
  return return_hash
end

def apply_coupons(cart, coupons)
  # code here
  if coupons.empty?
    return cart
  else
    new_cart = cart
    coupons.each do |i|
      item_name = i[:item]
      item_count = i[:num]
      if cart.include?(item_name) && cart[item_name][:count] >= item_count
        new_cart[item_name][:count] = -item_count
        new_cart["#{item_name} W/COUPON"] ={
          :price => cart[item_name][:price] / new_cart[item_name][:count],
          :clearance => true,
          :count => i[item_name][:count]
        }
      end
    end
  end
  return new_cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
