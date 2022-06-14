(* Homework1 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

use "hw1.sml";

val test1 = is_older ((2020,2,3),(2022,3,4)) = true
val test2 = is_older ((2023,2,3),(2022,3,4)) = false
val test3 = number_in_month ([(2012,2,28),(2013,12,1)],2) = 1
val test4 = number_in_month ([(2020, 2, 24), (2020, 2, 25)],2) = 2
val test5 = number_in_month ([(2020, 2, 24), (2020, 2, 25)],1) = 0
val test6 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3
val test7 = dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]
val test8 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
val test9 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there"
val test10 = date_to_string (2013, 6, 1) = "June 1, 2013"
val test11 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3
val test12 = number_before_reaching_sum (5, [1,2,3,4,5]) = 2
val test13 = number_before_reaching_sum (15, [1,2,3,4,5]) = 4
val test14 = number_before_reaching_sum (8, [4,3,2]) = 3
val test15 = number_before_reaching_sum (5, [4,1,1]) = 4
val test16 = what_month 70 = 3
val test17 = what_month 1 = 1
val test18 = what_month 364 = 12
val test19 = what_month 365 = 12
val test20 = what_month 32 = 2
val test21 = month_range (31, 34) = [1,2,2,2]
val test22 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME((2011,4,28))
