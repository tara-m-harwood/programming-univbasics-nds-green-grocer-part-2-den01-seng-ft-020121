require_relative './part_1_solution.rb'

<<<<<<< HEAD
unconsolidated_cart = [
  {:item => "AVOCADO", :price => 3.00, :clearance => true},
  {:item => "AVOCADO", :price => 3.00, :clearance => true},
  {:item => "AVOCADO", :price => 3.00, :clearance => true},  
  {:item => "KALE",    :price => 3.00, :clearance => false},
  {:item => "BEETS",  :price => 6.66, :clearance => true},
  {:item => "BEETS",  :price => 6.66, :clearance => true},
  {:item => "BEETS",  :price => 6.66, :clearance => true},
  {:item => "BEETS",  :price => 6.66, :clearance => true},
  {:item => "BEETS",  :price => 6.66, :clearance => true}  
]


consolidated_cart = [
  {:item => "AVOCADO", :price => 3.00, :clearance => true, :count => 3},
  {:item => "KALE",    :price => 3.00, :clearance => false, :count => 1},
  {:item => "BEETS",  :price => 6.66, :clearance => true, :count => 5}
=======
consolidated_cart = [
  {:item => "AVOCADO", :price => 3.00, :clearance => true, :count => 3},
  {:item => "KALE",    :price => 3.00, :clearance => false, :count => 1},
  {:item => "BEETS",  :price => 3.00, :clearance => false, :count => 5}
>>>>>>> 95009b7e47ba3f2f1b683a8cbf0622f47aa85dc6
]

coupons_clipped = [
  {:item => "KALE", :num => 1, :cost => 2.00},
  {:item => "BEETS", :num => 2, :cost => 1.00}
]


def apply_coupons(cart, coupons)
  discounts = [] # array we will use to store items after applied coupons
  cart.each do | cart_item | #loops through the items in the cart
    current_coupon = find_item_by_name_in_collection(cart_item[:item], coupons) #looks for a coupon with name of the item

    if current_coupon #checks if we found the coupon
    
      if current_coupon[:num] <= cart_item[:count] #checks if we have enough items in the cart to apply the coupon
        coupon_counter = 0 # stores how many times a coupon is applied to a unit
        
        while cart_item[:count] >= current_coupon[:num] #loops while there are enough items to apply the coupon
          cart_item[:count] -= current_coupon[:num] # decreases the original cart_item by the coupon number
          coupon_counter += current_coupon[:num] # increases the counter for time coupon applied
          # p cart_item
        end
        
      end
    # contructs the discounted item and adds it to the discounts array  
    discounts << {
    :item => cart_item[:item] + " W/COUPON",
    :price => current_coupon[:cost] / coupon_counter,
    :clearance => cart_item[:clearance],
    :count => coupon_counter
    }
     
    end
    
 end
 cart.concat discounts # adds all the discounted items to the cart
<<<<<<< HEAD
 #p cart
=======
 p cart
>>>>>>> 95009b7e47ba3f2f1b683a8cbf0622f47aa85dc6
 cart
end
    
# apply_coupons(consolidated_cart, coupons_clipped)

def apply_clearance(cart)
  cart.each do | cart_item |
<<<<<<< HEAD
    if cart_item[:clearance]
     cart_item[:price] = (cart_item[:price] - (cart_item[:price] * 0.2)).round(2)
    end 
  end
  #p "***"
  #p cart
end

# apply_clearance(consolidated_cart)
=======
    p cart_item[:item] + " " + cart_item[:price].to_s
  end
  p "***"
  p cart
end

apply_clearance(consolidated_cart)
>>>>>>> 95009b7e47ba3f2f1b683a8cbf0622f47aa85dc6

def checkout(cart, coupons)
  total = 0
  consolidated_cart = consolidate_cart(cart)
  coupon_cart = apply_coupons(consolidated_cart, coupons)
  final_cart = apply_clearance(coupon_cart)
  final_cart.each do | cart_item |
    total += cart_item[:price] * cart_item[:count]
  end
  # p final_cart
  if total > 100
    total -= total * 0.1
  end  
  total
end

checkout(unconsolidated_cart, coupons_clipped)
