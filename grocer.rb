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

  coupons.each do |coupon|
    name = coupon[:item] #avocado, cheese,...
    num_of_c = coupon[:num]
    if cart.include?(name) && cart[name][:count] >= num_of_c
       #remove number of the new_cart's count
       new_cart[name][:count] -= num_of_c
       if new_cart["#{name} W/COUPON"]
         new_cart["#{name} W/COUPON"][:count] += coupon[:num]
       else
         new_cart["#{name} W/COUPON"] = {
           :price => coupon[:cost] / coupon[:num],
           :clearance => new_cart[name][:clearance],
           :count => coupon[:num]
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
