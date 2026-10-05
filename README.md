# Turing Machines 

In this repository, I designed some Turing machines using `Tursi.jar`.  

## How to use `Tursi.jar` 
- write your Turing machine codes in a `.tm` file. 
- open `Tursi.jar` by double clicking on it. 
- add your `.tm` file by 
    > File > Open > `your_file.tm`. 
- insert the word to be written onto the tape [top right input field], and press enter. 
- press the `green button` for automatic execution.  

- For more information visit [Tursi](https://schaetzc.github.io/tursi/). 


## What to Write the `.tm` File 
- use `#` for comments. 
- use `#!` for commands. 
    ```
    # useful commands: 
    #! start q_start 
    #! end q_end 
    #! fill fill_character  
    ``` 
- write transition rules. 
    - format: 
        > q_current_state read_symbol write_symbol Movement_Direction q_next_state 
    - example: 
        ```
        q_start 0 X R q_m 
        ``` 
    - meaning: 
        - current state = q_start. 
        - read symbol = 0. 
        - write symbol = X. 
        - move direction = R (right). 
        - next state = q_m. 

## Content 
**CSE211** - Theory of Computation.  
**Md. Misbah Uddin Rafi**.  
Id: **2305069**.  
Department of CSE, BUET. 