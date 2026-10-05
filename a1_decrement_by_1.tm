# decrement by 1 
# input format: wc 
# w is a binary string (LSB...MSB) 
# c = separator character 

# commands 
#! start q_start0 
#! end q_end 
#! fill _ 


# meaning of states 
# q_start0 : searching for left most bit of w, and current carry is 0 
# q_start1 : searching for left most bit of w, and current carry is 1 
# q_r1c0 : result is 1, carry is 0, and searching for c 
# q_r0c1 : result is 0, carry is 1, and searching for c 
# q_r1c1 : result is 1, carry is 1, and searching for c 
# q_c0 : result writing done, returning to w, with carry 0 
# q_c1 : result writing done, returning to w, with carry 1 
# q_end: all done, accepting state 

# rules 
# searching for left most bit in w 
q_start0 0 X R q_r1c0 
q_start0 1 X R q_r0c1 
q_start0 c c R q_end 

q_start1 0 X R q_r0c1 
q_start1 1 X R q_r1c1 
q_start1 c c R q_end 


# read left most character from w, now searching c 
q_r0c1 0 0 R q_r0c1 
q_r0c1 1 1 R q_r0c1 
q_r0c1 c c R q_r0c1 
q_r0c1 _ 0 L q_c1 

q_r1c0 0 0 R q_r1c0 
q_r1c0 1 1 R q_r1c0 
q_r1c0 c c R q_r1c0 
q_r1c0 _ 1 L q_c0 

q_r1c1 0 0 R q_r1c1 
q_r1c1 1 1 R q_r1c1 
q_r1c1 c c R q_r1c1 
q_r1c1 _ 1 L q_c1 


# result writing done, now return to w 
q_c0 0 0 L q_c0 
q_c0 1 1 L q_c0 
q_c0 c c L q_c0 
q_c0 X X R q_start0 

q_c1 0 0 L q_c1 
q_c1 1 1 L q_c1 
q_c1 c c L q_c1 
q_c1 X X R q_start1 