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
    item_name = coupons[:item]
    item_count = coupons[:num]
    coupons.each do |i|
      if cart.include?(item_name) && cart[item_name][:count] >= item_count
        new_cart[item_name][:count] -= item_count
        new_cart["#{item_name} W/COUPON"] ={
          :price => coupon[item_name][]
        }
      end
    end
  end
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
