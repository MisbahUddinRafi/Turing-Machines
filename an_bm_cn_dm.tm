# input: a^nb^mc^nd^m where m, n >= 1 
# equal number of a and c 
# equal number of b and d 

# commands 
#! start q_start 
#! end q_end 
#! fill _ 


# meaning of states 
q_start: no symbol read yet, searching for a 
q_a: read one a, searching for c 
q_ac: read one a and one c, returning to left most unmarked a 
q_b: read one b, searching for d (and all a and c are marked) 
q_bd: read one b and one d, returning to the left most unmarked b 





# phase 1: mark a and c 
q_start a X R q_a 
q_start b Y R q_b 

q_start Y Y R q_start 
q_start Z Z R q_start 
q_start W W R q_start 
q_start _ _ L q_end 

q_a a a R q_a 
q_a b b R q_a 
q_a Z Z R q_a 
q_a c Z L q_ac 

q_ac Z Z L q_ac 
q_ac b b L q_ac 
q_ac a a L q_ac 
q_ac X X R q_start 

# phase 2: mark b and d (all a and c are already marked) 
q_b b b R q_b 
q_b Z Z R q_b
q_b W W R q_b 
q_b d W L q_bd 

q_bd W W L q_bd 
q_bd Z Z L q_bd  
q_bd b b L q_bd  
q_bd Y Y R q_start  

