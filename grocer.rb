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
  return cart if coupons == []
  new_cart = cart

  coupons.each do |current_coupon|
    name = current_coupon[:item]
    quantity = current_coupon[:num]
    if cart.include?(name) && cart[name][:count] >= quantity
       new_cart[name][:count] -= quantity
       if new_cart["#{name} W/COUPON"]
         new_cart["#{name} W/COUPON"][:count] += current_coupon[:num]
       else
         new_cart["#{name} W/COUPON"] = {
           :price => current_coupon[:cost] / current_coupon[:num],
           :clearance => new_cart[name][:clearance],
           :count => current_coupon[:num]
         }
       end
     end
   end
   return new_cart
end
def apply_clearance(cart)
  # code here
  new_cart = cart
  cart.each do |item, hash|
    if hash[:clearance]
      new_cart[name][price] = (cart[name][:price] * 0.8).round(2)
    end
  end
  return new_cart
end

def checkout(cart, coupons)
  # code here
  new_cart = consolidate_cart(cart)
  new_cart = apply_coupons(new_cart,coupons)
  new_cart = apply_clearance(new_cart,clearance)
  sum = 0
  new_cart.each do |name, hash|
    sum += cart[hash][:price] * cart[:hash][:count]
  end
  
  if sum > 100
    sum *= .9
  end
  return sum
end
