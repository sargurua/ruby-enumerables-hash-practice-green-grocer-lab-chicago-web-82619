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
  #doesn't break if there is no coupon
  return cart if coupons == []

  #set new_cart = cart so we don't have to push all the values, just change them
  new_cart = cart

  coupons.each do |coupon|
    name = coupon[:item] #avocado, cheese,...
    num_of_c = coupon[:num]
    #if the cart has the same item in coupon and has larger amount than in coupon
    if cart.include?(name) && cart[name][:count] >= num_of_c
       #remove number of the new_cart's count
       new_cart[name][:count] -= num_of_c
       #increase the count when there is more items than the coupon allows
       if new_cart["#{name} W/COUPON"]
         new_cart["#{name} W/COUPON"][:count] += 1
       #set the name with coupon with new value
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
