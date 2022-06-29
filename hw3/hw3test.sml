(* Homework3 Simple Test*)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

val test1a = only_capitals ["A","B","C"] = ["A","B","C"]
val test1b = only_capitals ["A","B","c"] = ["A","B"]
val test1c = only_capitals [] = []


val test2a = longest_string1 ["A","bc","C"] = "bc"
val test2b = longest_string1 ["a","b","c"] = "a"
val test2c = longest_string1 [] = ""

val test3a = longest_string2 ["A","bc","C"] = "bc"
val test3b = longest_string2 ["a","b","c"] = "c"
val test3c = longest_string2 [] = ""

val test4a = longest_string3 ["A","bc","C"] = "bc"
val test4b = longest_string4 ["A","B","C"] = "C"

val test5a = longest_capitalized ["A","bc","C"] = "A"
val test5b = longest_capitalized ["A", "AB", "ABC"] = "ABC"
val test5c = longest_capitalized ["ABC", "BCA", "C"] = "ABC"

val test6a = rev_string "abc" = "cba"

val test7a = first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3,4,5] = 4
val test7b = ((first_answer (fn x => if x > 5 then SOME x else NONE) [1,2,3,4,5];
			   false)
			   handle NoAnswer => true)


val test8a = all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,3,4,5,6,7] = NONE
val test8b = all_answers (fn x => if x = 2 then SOME [x] else NONE) [2,2] = SOME [2,2]
val test8c = all_answers (fn x => if x = 2 then SOME [x] else NONE) [2,2,3] = NONE
val test8d = all_answers (fn x => if x = 2 then SOME [x] else NONE) [] = SOME []  

val test9a1 = count_wildcards Wildcard = 1
val test9a2 = count_wildcards (Variable "str") = 0
val test9a3 = count_wildcards (TupleP [Wildcard, ConstP 12, Wildcard]) = 2
val test9a4 = count_wildcards (ConstructorP("pattern", (TupleP [Wildcard, ConstP 12, Wildcard]))) = 2

val test9b1 = count_wild_and_variable_lengths (Variable("a")) = 1
val test9b2 = count_wild_and_variable_lengths (TupleP [Wildcard, Variable("ab"), Wildcard]) = 4

val test9c1 = count_some_var ("x", Variable("x")) = 1
val test9c2 = count_some_var ("x", TupleP [Variable("x"), ConstP 12, Wildcard, Variable("x")]) = 2

val test10a = check_pat (Variable("x")) = true
val test10b = check_pat (TupleP [Variable("x"), ConstP 12, Wildcard, Variable("x")]) = false
val test10c = check_pat (TupleP [Variable("x"), ConstP 12, Wildcard, Variable("y")]) = true

(*
val test11a = match (Const(1), UnitP) = NONE
val test11b = match (Const(1), Variable "a") = SOME [("a",Const 1)]
val test11c = match (Unit, UnitP) = SOME []
val test11d = match (Const 17, ConstP 17) = SOME []
val test11e = match (Const 17, ConstP 18) = NONE
val test11f = match (Constructor ("c0", Const 3), ConstructorP ("c0", ConstP 3)) = SOME []
val test11g = match (Tuple [Const 3, Const 4], TupleP [Variable "a", Variable "b"]) = SOME [("a",Const 3),("b",Const 4)]
*)
(*
val test12 = first_match Unit [UnitP] = SOME []
*)
