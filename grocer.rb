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
    coupons.each do |coupon|
      name = coupon[:item] #avocado, cheese,...
      num_of_c = coupon[:num]
      if cart.include?(name) && cart[name][:count] >= num_of_c
        new_cart[name][:count] -= num_of_c
        if new_cart["#{name} W/COUPON"]
          new_cart["#{name} W/COUPON"][:count] += 1
        else
          new_cart["#{name} W/COUPON"] = {
            :price => coupon[:cost],
            :clearance => new_cart[name][:clearance],
            :count => 1
          }
       end
     end
   end
   new_cart
end


def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
