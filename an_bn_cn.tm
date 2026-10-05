# language: a^n b^n c^n, where n >= 0 
# input: a^nb^nc^n 
# a^n = symbol 'a' repeated for n times (a^3 = aaa) 

# commands 
#! start q_start 
#! end q_end 
#! fill _ 


# meaning of states 
# q_start: no symbol read yet 
# q_a: one 'a' marked, searching for 'b' 
# q_ab: one 'a' and one 'b' marked, searching for 'c' 
# q_return: one 'a', one 'b', and one 'c' marked, now searching left for 'a' 
# q_final_run: all 'a's are marked, so all 'b' and 'c' should also be marked 
# q_end: equal number of 'a', 'b', 'c' found. processing done. 


# replacement symbols 
# X for marked a 
# Y for marked b 
# Z for marked c 


# transition rules 
# n = 0 case 
q_start _ _ R q_end 

# mark a 
q_start a X R q_a 

# search for b and mark it 
q_a a a R q_a 
q_a Y Y R q_a 
q_a b Y R q_ab 

# search for c and mark it 
q_ab b b R q_ab 
q_ab Z Z R q_ab 
q_ab c Z L q_return 

# return and search for a again 
q_return Z Z L q_return 
q_return b b L q_return 
q_return Y Y L q_return 
q_return a a L q_return 
q_return X X R q_start 

# all a's are marked, final run checks if all b's and c's are also marked or not 
q_start Y Y R q_final_run 
q_final_run Y Y R q_final_run 
q_final_run Z Z R q_final_run 
q_final_run _ _ R q_end   



