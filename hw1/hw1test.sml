(* Homework1 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

use "hw1.sml";

val test_is_older_1 = is_older ((2020,2,3),(2022,3,4)) = true
val test_is_older_2 = is_older ((2023,2,3),(2022,3,4)) = false
val test_is_older_3 = is_older((1,2,25), (1,2,25)) = false
val test_is_older_4 = is_older((1,2,25), (6,7,8)) = true

val test_number_in_month_1 = number_in_month ([(2012,2,28),(2013,12,1)],2) = 1
val test_number_in_month_2 = number_in_month ([(2020, 2, 24), (2020, 2, 25)],2) = 2
val test_number_in_month_3 = number_in_month ([(2020, 2, 24), (2020, 2, 25)],1) = 0

val test_number_in_months_1 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3

val test_dates_in_month_1 = dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]

val test_dates_in_months_1 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]

val test_get_nth_1 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there"

val test_date_to_string_1 = date_to_string (2013, 6, 1) = "June 1, 2013"

val test_number_before_reaching_sum_1 = number_before_reaching_sum(10, [2,4,6]) = 2
val test_number_before_reaching_sum_2 = number_before_reaching_sum(5, [2,4,6]) = 1
val test_number_before_reaching_sum_3 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3
val test_number_before_reaching_sum_4 = number_before_reaching_sum (14, [2,5,6,10,11]) = 3

val test_what_month_1 = what_month 70 = 3
val test_what_month_2 = what_month 355 = 12
val test_what_month_3 = what_month 1 = 1
val test_what_month_4 = what_month 60 = 3
val test_what_month_5 = what_month 150 = 5

val test_month_range_1 = month_range(31,34) = [1,2,2,2]
val test_month_range_2 = month_range(85,145) = [3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5]

val test_oldest_1 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) =
  SOME((2011,3,31))

val test_number_in_months_challenge_1 = number_in_months_challenge
([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,3,4]) = 3
val test_number_in_months_challenge_2 = number_in_months_challenge
([(2012,2,28),(2013,12,1),(2011,3,31),(2011,3,31),(2011,4,28)],[2,3,4,4]) = 3

val test_dates_in_months_challenge_1 = dates_in_months_challenge
([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,2]) = [(2012,2,28)]
