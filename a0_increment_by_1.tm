# increment the given binary number by 1 
# input: wc 
# input format: wc 
# w is a binary string (LSB...MSB) 

# commands 
#! start q_start1 
#! end q_end 
#! fill _ 


# meaning of states 
# q_start0 : current carry is 0, searching for left most unprocessed bit of w 
# q_start1 : current carry is 1, searching for left most unprocessed bit of w 
# q_w0c0 : write 0, carry 0 
# q_w0c1 : write 0, carry 1 
# q_w1c0 : write 1, carry 0 
# q_return_c0: return to w after writing, with current carry 0 
# q_return_c1: return to w after writing, with current carry 1  
# q_end : end of processing 


q_start1 0 X R q_w1c0 
q_start1 1 X R q_w0c1 
q_start1 c c R q_w1c0 

q_start0 0 X R q_w0c0 
q_start0 1 X R q_w1c0 
q_start0 c c R q_end 


q_w1c0 0 0 R q_w1c0 
q_w1c0 1 1 R q_w1c0 
q_w1c0 c c R q_w1c0 
q_w1c0 _ 1 L q_return_c0 

q_w0c1 0 0 R q_w0c1 
q_w0c1 1 1 R q_w0c1 
q_w0c1 c c R q_w0c1 
q_w0c1 _ 0 L q_return_c1 

q_w0c0 0 0 R q_w0c0 
q_w0c0 1 1 R q_w0c0 
q_w0c0 c c R q_w0c0 
q_w0c0 _ 0 L q_return_c0 

q_return_c0 0 0 L q_return_c0 
q_return_c0 1 1 L q_return_c0 
q_return_c0 c c L q_return_c0 
q_return_c0 X X R q_start0  
q_return_c0 _ _ R q_start0  


q_return_c1 0 0 L q_return_c1 
q_return_c1 1 1 L q_return_c1 
q_return_c1 c c L q_return_c1 
q_return_c1 X X R q_start1  

