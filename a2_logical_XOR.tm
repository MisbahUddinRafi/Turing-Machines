# Logical XOR operation of two binary 
# input: w1cw2c 
# w1 = first binary 
# w2 = second binary 
# c = separator character 

# commands 
#! start q_start 
#! end q_end 
#! fill _ 

# meaning of states 
# q_start: no symbols read yet, in w1 
# q_0_w1: read 0, still in w1 
# q_1_w1: read 1, still in w1 
# q_w2: read nothing from w1 (w1 is done), now searching symbol in w2 
# q_0_w2: read 0 from w1, searching in w2 now 
# q_1_w2: read 1 from w1, searching in w2 now 
# q_w2_write0: result is 0, but we are in w2 now, moving right 
# q_w2_write1: result is 1, but we are in w2 now, moving right 
# q_write0: result is 0, we are in w3 now, moving right 
# q_write1: result is 1, we are in w3 now, moving right 
# q_return_w3: result writing done, returning to left most unprocessed symbol, but now in w3 
# q_return_w2: returning to left most unprocessed symbol, but now in w2 
# q_return_w1: returning to left most unprocessed symbol, now in w1 
# q_end: all symbols of w1 and w2 are marked, processing is done.  




# transition rules 

q_start 0 X R q_0_w1 
q_start 1 X R q_1_w1 
q_start c c R q_w2 

q_0_w1 0 0 R q_0_w1
q_0_w1 1 1 R q_0_w1
q_0_w1 c c R q_0_w2 

q_1_w1 0 0 R q_1_w1
q_1_w1 1 1 R q_1_w1
q_1_w1 c c R q_1_w2 

# in w2 
q_w2 X X R q_w2 
q_w2 c c R q_end 
q_w2 0 X R q_w2_write0 
q_w2 1 X R q_w2_write1 

q_0_w2 X X R q_0_w2 
q_0_w2 c c R q_write0 
q_0_w2 0 X R q_w2_write0 
q_0_w2 1 X R q_w2_write1 

q_1_w2 X X R q_1_w2 
q_1_w2 c c R q_write1 
q_1_w2 0 X R q_w2_write1 
q_1_w2 1 X R q_w2_write0 

q_w2_write0 0 0 R q_w2_write0 
q_w2_write0 1 1 R q_w2_write0 
q_w2_write0 c c R q_write0 

q_w2_write1 0 0 R q_w2_write1 
q_w2_write1 1 1 R q_w2_write1 
q_w2_write1 c c R q_write1 


# in w3 
q_write0 0 0 R q_write0 
q_write0 1 1 R q_write0 
q_write0 _ 0 L q_return_w3 

q_write1 0 0 R q_write1 
q_write1 1 1 R q_write1 
q_write1 _ 1 L q_return_w3 

# returning: in w3
q_return_w3 0 0 L q_return_w3
q_return_w3 1 1 L q_return_w3
q_return_w3 c c L q_return_w2

# returning: in w2 
q_return_w2 0 0 L q_return_w2
q_return_w2 1 1 L q_return_w2
q_return_w2 X X L q_return_w2
q_return_w2 c c L q_return_w1 

# returning: in w1 
q_return_w1 0 0 L q_return_w1
q_return_w1 1 1 L q_return_w1
q_return_w1 X X R q_start 
q_return_w1 _ _ R q_start  





