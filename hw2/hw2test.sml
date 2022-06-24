(* Homework2 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

val test1a_1 = all_except_option ("string", ["string"]) = SOME []
val test1a_2 = all_except_option ("string", ["test1", "string", "test2"]) = SOME ["test1", "test2"]
val test1a_3 = all_except_option ("string", ["test1", "test2", "string"]) = SOME ["test1", "test2"]
val test1a_4 = all_except_option ("string", ["test1", "test2"]) = NONE
val test1a_5 = all_except_option ("string", []) = NONE
val test1a_6 = all_except_option ("string", ["test1", "string", "test2", "test3"]) = SOME ["test1", "test2", "test3"]

val test1b_1 = get_substitutions1 ([["foo"],["there"]], "foo") = []
val test1b_2 = get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],
"Fred") = ["Fredrick","Freddie","F"]
val test1b_3 = get_substitutions1([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]],
"Jeff") = ["Jeffrey","Geoff","Jeffrey"] 

val test1c_1 = get_substitutions2 ([["foo"],["there"]], "foo") = []
val test1c_2 = get_substitutions2([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],
"Fred") = ["Fredrick","Freddie","F"]
val test1c_3 = get_substitutions2([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]],
"Jeff") = ["Jeffrey","Geoff","Jeffrey"] 

val test1d_1 = similar_names ([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"}) = [{first="Fred", last="Smith", middle="W"}, {first="Fredrick", last="Smith", middle="W"},
      {first="Freddie", last="Smith", middle="W"}, {first="F", last="Smith", middle="W"}]

val test1d_2 = similar_names ([], {first="Fred", middle="W", last="Smith"}) = [{first="Fred",last="Smith",middle="W"}]

val test2a_1 = card_color (Clubs, Num 2) = Black

val test2b_1 = card_value (Clubs, Num 2) = 2

val test2c_1 = remove_card ([(Hearts, Ace)], (Hearts, Ace), IllegalMove) = []

val test2d_1 = all_same_color [(Hearts, Ace), (Hearts, Ace)] = true
val test2d_2 = all_same_color [(Hearts, Ace), (Clubs, Ace)] = false
val test2d_3 = all_same_color [(Clubs, Ace), (Spades, Ace), (Diamonds, Ace)] = false


val test2e_1 = sum_cards [(Clubs, Num 2),(Clubs, Num 2)] = 4


val test2f_1 = score ([(Hearts, Num 2),(Clubs, Num 4)],10) = 4
val test2f_2 = score ([(Hearts, Num 2),(Hearts, Num 4)],10) = 2


val test2g_1 = officiate ([(Hearts, Num 2),(Clubs, Num 4)],
                          [Draw], 
                          15)
             = 6

val test2g_2 = officiate ([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
                        [Draw,Draw,Draw,Draw,Draw],
                        42)
             = 3
val test2g_3 = ((officiate([(Clubs,Jack),(Spades,Num(8))],
                           [Draw,Discard(Hearts,Jack)],
                           42);
               false) 
              handle IllegalMove => true)

