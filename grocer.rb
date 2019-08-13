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
    coupons.each do |i|
      if cart.include?(coupons[:item]) && cart[coupons[:item]][:count] >= coupons[:num]
      
    end
  end
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
