# CSE 211 Assignment Problem a3 solution 

# logical AND of two binary inputs 
# input: w1cw2c 
# w1: first binary string (LSB...MSB) 
# w2: second binary string (LSB...MSB) 
# c: separator character 


# commands
#! start q_start 
#! end q_end 
#! fill _


# meaning of states 
# q_start : start state, no symbol read yet 
# q_0_w1 : read 0 from w1, looking for first c 
# q_1_w1 : read 1 from w1, looking for first c 
# q_w2 : read nothing from w1 (w1 is done), now in w2  
# q_0_w2 : read 0 from w1, looking for symbol in w2 
# q_1_w2 : read 1 from w1, looking for symbol in w2  
# q_w2_write0 : symbol reading done from w2, final write result is 0 
# q_w2_write1 : symbol reading done from w2, final write result is 1 
# q_write0 : now in w3, write result is 0, moving right to find an empty slot for result 
# q_write1 : now in w3, write result is 1, moving right to find an empty slot for result 
# q_return_w3 : result writing done, returning to w1, but now in w3
# q_return_w2 : result writing done, returning to w1, but now in w2
# q_return_w1 : returned to w1, now searching for the left most unprocessed symbol 
# q_end : all symbols of w1 and w2 are marked X, processing done 



# transition rules 
q_start 0 X R q_0_w1 
q_start 1 X R q_1_w1 
q_start c c R q_w2  

q_w2 c c R q_end 
q_w2 X X R q_w2 
q_w2 0 X R q_w2_write0 
q_w2 1 X R q_w2_write0 

q_0_w1 0 0 R q_0_w1 
q_0_w1 1 1 R q_0_w1 
q_0_w1 c c R q_0_w2 
q_0_w2 X X R q_0_w2  
q_0_w2 0 X R q_w2_write0 
q_0_w2 1 X R q_w2_write0 
q_0_w2 c c R q_write0 

q_1_w1 0 0 R q_1_w1 
q_1_w1 1 1 R q_1_w1 
q_1_w1 c c R q_1_w2 
q_1_w2 X X R q_1_w2  
q_1_w2 0 X R q_w2_write0 
q_1_w2 1 X R q_w2_write1 
q_1_w2 c c R q_write0 

q_w2_write0 0 0 R q_w2_write0 
q_w2_write0 1 1 R q_w2_write0 
q_w2_write0 c c R q_write0 

q_w2_write1 0 0 R q_w2_write1 
q_w2_write1 1 1 R q_w2_write1 
q_w2_write1 c c R q_write1 

q_write0 0 0 R q_write0 
q_write0 1 1 R q_write0 
q_write0 _ 0 L q_return_w3 

q_write1 0 0 R q_write1 
q_write1 1 1 R q_write1 
q_write1 _ 1 L q_return_w3 

q_return_w3 0 0 L q_return_w3 
q_return_w3 1 1 L q_return_w3 
q_return_w3 c c L q_return_w2 

q_return_w2 0 0 L q_return_w2 
q_return_w2 1 1 L q_return_w2 
q_return_w2 X X L q_return_w2
q_return_w2 c c L q_return_w1 

q_return_w1 0 0 L q_return_w1 
q_return_w1 1 1 L q_return_w1 
q_return_w1 X X R q_start 
q_return_w1 _ _ R q_start

























