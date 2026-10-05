# language: #a = #b = #c in w 
# input: w = {a, b, c}* 

# commands 
#! start q_start 
#! end q_end 
#! fill _ 

# meaning of states 
# q_start: search for an 'a' 
# q_a: got an 'a', now search for a 'b' while moving left 
# q_ab: got an 'a' and a 'b', keep moving left and search for 'c' 
# q_find_a: search for an 'a' (we already know that there are some b's and/or c's left) 
# q_find_b: search for a 'b' (we already got an 'a') 
# q_find_c: search for a 'c' (we already got an 'a' and a 'b')
# q_return: we got an 'a', 'b', 'c' tuple, return to left most position, and start searching again  
# q_end: equal number of 'a', 'b' and 'c' found. processing done. 


# replacement symbol 
# X = marked a/b/c. 

# transition rules 

# mark one a first 
q_start a X L q_a 
q_start X X R q_start 
q_start _ _ L q_end 

# there are more b's and c's left, so we must find one a 
q_start b b R q_find_a 
q_start c c R q_find_a 

q_find_a a X L q_a 
q_find_a X X R q_find_a 
q_find_a b b R q_find_a 
q_find_a c c R q_find_a  


# find b 
# search on left side 
q_a a a L q_a 
q_a X X L q_a 
q_a c c L q_a 
q_a _ _ R q_find_b  
q_a b X L q_ab  

# search on right side 
q_find_b a a R q_find_b 
q_find_b X X R q_find_b 
q_find_b c c R q_find_b 
q_find_b b X L q_ab  


# find c 
# search on left side 
q_ab X X L q_ab 
q_ab a a L q_ab  
q_ab b b L q_ab 
q_ab _ _ R q_find_c 
q_ab c X L q_return 

# search on right side 
q_find_c a a R q_find_c 
q_find_c b b R q_find_c 
q_find_c X X R q_find_c 
q_find_c c X L q_return 


# return to left most position to start searching again 
q_return a a L q_return 
q_return b b L q_return
q_return c c L q_return
q_return X X L q_return 
q_return _ _ R q_start 
