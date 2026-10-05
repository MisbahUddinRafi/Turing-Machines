# CSE 211 Assignment Problem a4 solution 

# logical OR of two binary inputs 
# input: w1cw2c 
# w1: first binary string (LSB...MSB) 
# w2: second binary string (LSB...MSB) 
# c: separator character 


# commands
#! start q_start 
#! end q_end 
#! fill _


# meaning of states 
# q_start : haven't read any symbol yet from w1 
# q_0 : read 0 from w1, now searching for first c   
# q_1 : read 1 from w1, now searching for first c 
# q_c : w1 is done, read nothing from w1 
# q_0c: read 0 from w1 and now searching in w2 
# q_1c: read 1 from w1 and now searching in w2 
# q_0_search_c : reading done, result is 0, now search for second c  
# q_1_search_c : reading done, result is 1, now search for second c 
# q_write0 : reading done from w1 and w2, now write result 0 in w3 
# q_write1 : reading done from w1 and w2, now write result 1 in w3 
# q_r3 : result writing done, now returning, but still in w3 
# q_r2 : returning, and now in w2 
# q_r1 : returning, and now in w1  
# q_end : all done, final accepting state 


# replacement character
# X : replacement character for both read 0 and 1


# format: 
# current_q read_symbol write_symbol shift_L/R new_q 


# read left most bit from w1 
q_start 0 X R q_0 
q_start 1 X R q_1 
q_start c c R q_c 

# after reading 0 from w1 
q_0 0 0 R q_0 
q_0 1 1 R q_0 
q_0 c c R q_0c 

# after reading 1 from w1 
q_1 0 0 R q_1 
q_1 1 1 R q_1 
q_1 c c R q_1c 


# searching left most unprocessed bit of w2 
q_0c X X R q_0c 
q_0c c c R q_write0 
q_0c 0 X R q_0_search_c 
q_0c 1 X R q_1_search_c 

q_1c X X R q_1c 
q_1c c c R q_write1 
q_1c 0 X R q_1_search_c 
q_1c 1 X R q_1_search_c 

q_c X X R q_c 
q_c c c R q_end 
q_c 0 X R q_0_search_c 
q_c 1 X R q_1_search_c


# searching second c 
q_0_search_c 0 0 R q_0_search_c 
q_0_search_c 1 1 R q_0_search_c 
q_0_search_c c c R q_write0 

q_1_search_c 0 0 R q_1_search_c 
q_1_search_c 1 1 R q_1_search_c 
q_1_search_c c c R q_write1 


# now in w3, searching for a writing position 
q_write0 0 0 R q_write0 
q_write0 1 1 R q_write0 
q_write0 _ 0 L q_r3 

q_write1 0 0 R q_write1 
q_write1 1 1 R q_write1 
q_write1 _ 1 L q_r3 


# returning, but still in w3 
q_r3 0 0 L q_r3 
q_r3 1 1 L q_r3 
q_r3 c c L q_r2 

# returning, and now in w2 
q_r2 0 0 L q_r2 
q_r2 1 1 L q_r2
q_r2 X X L q_r2 
q_r2 c c L q_r1 

# returning, and now in w1, and searching for left most unprocessed bit 
q_r1 0 0 L q_r1 
q_r1 1 1 L q_r1
q_r1 X X R q_start 
q_r1 _ _ R q_start 