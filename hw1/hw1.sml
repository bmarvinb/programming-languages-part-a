(*
* Helpers
*)
fun date_year(date : (int * int * int)) = (#1 date)
fun date_month(date : (int * int * int)) = (#2 date)
fun date_day(date : (int * int * int)) = (#3 date)
    
fun some(xs : int list, date : (int * int * int)) =
  if null xs
  then false
  else if date_month(date) = hd xs
    then true
    else some(tl xs, date)

(* Exercise 1 *)
fun is_older(d1 : (int * int * int), d2 : (int * int * int)) =
  if date_year(d1) > date_year(d2)
  then false
  else if date_month(d1) > date_month(d2)
    then false
    else if date_day(d1) > date_day(d2)
      then false
      else true

(* Exercise 2 *)
fun number_in_month(xs : (int * int * int) list, month : int) =
  if null xs
  then 0
  else if date_month(hd xs) = month
      then 1 + number_in_month(tl xs, month)
      else number_in_month(tl xs, month)

(* Exercise 3 *)
fun number_in_months(dates : (int * int * int) list, xs : int list) =
  if null dates
  then 0
  else if some(xs, hd dates)
    then 1 + number_in_months(tl dates, xs)
    else number_in_months(tl dates, xs)

(* Exercise 4 *)
fun dates_in_month(dates : (int * int * int) list, month : int) = 
  if null dates
  then []
  else if date_month(hd dates) = month
    then hd dates :: dates_in_month(tl dates, month)
    else dates_in_month(tl dates, month)

(* Exercise 5 *)
fun dates_in_months(dates : (int * int * int) list, xs : int list) =
  if null dates
  then []
  else if some(xs, hd dates)
    then hd dates :: dates_in_months(tl dates, xs)
    else dates_in_months(tl dates, xs)

(* Exercise 6 *)
fun get_nth(xs : (string) list, n : int) = 
  if n = 1
  then (hd xs)
  else get_nth(tl xs, n - 1)

(* Exercise 7 *)
fun date_to_string(date : (int * int * int)) = 
  let 
    val months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ]
  in
   get_nth(months, date_month date) 
   ^ " " 
   ^ Int.toString(date_day date) 
   ^ ", "
   ^ Int.toString(date_year date)  
  end

(* Exercise 8 *)
fun number_before_reaching_sum(n : int, xs : (int) list) =
  if n - (hd xs) - (hd (tl xs)) <= 0
  then hd xs
  else number_before_reaching_sum(n - hd xs, tl xs)

(* Exercise 9 *)
fun what_month(day : int) =
  let 
    val months = [31,29,31,30,30,30,31,31,30,31,30,31]

    fun get_month_by_date(n: int, xs: (int) list, month: int) =
      if n - (hd xs) <= 0
        then month
        else get_month_by_date(n - hd xs, tl xs, month + 1)
  in
    get_month_by_date(day, months, 1)
  end

(* Exercise 10 *)
fun month_range(day1 : int, day2 : int) = 
  if day1 > day2
  then []
  else what_month(day1) :: month_range(day1 + 1, day2)

(* Exercise 11 *)
fun oldest(dates : (int * int * int) list) =
  let
    fun get_oldest(date : (int * int * int), dates : (int * int * int) list) = 
    if null dates
    then date
    else if is_older(date, hd dates)
      then get_oldest(date, tl dates)
      else get_oldest(hd dates, tl dates)
  in
    if null dates
    then NONE
    else SOME(get_oldest(hd dates, tl dates))
  end

