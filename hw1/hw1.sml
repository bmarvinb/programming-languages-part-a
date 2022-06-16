(* Helpers *)
fun date_year(date : (int * int * int)) = (#1 date)
fun date_month(date : (int * int * int)) = (#2 date)
fun date_day(date : (int * int * int)) = (#3 date)
    
fun includes(xs : int list, date : (int * int * int)) =
  if null xs
  then false
  else if date_month(date) = hd xs
    then true
    else includes(tl xs, date)

(* Exercise 1 *)
fun is_older(d1 : (int * int * int), d2 : (int * int * int)) =
    date_year(d1) < date_year(d2) 
    orelse date_year(d1) = date_year(d2) andalso date_month(d1) < date_month(d2) 
    orelse date_month(d1) = date_month(d2) andalso date_day(d1) < date_day(d2)

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
  else if includes(xs, hd dates)
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
  if null xs
  then []
  else dates_in_month(dates, hd xs) @ dates_in_months(dates, tl xs)

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
fun number_before_reaching_sum(sum : int, xs : int list) =
  let
    fun count(n : int, i : int, xy : int list) =
      if (n + (hd xy) >= sum)
      then i
      else count(n + (hd xy), i + 1, tl xy)
  in
    count(0, 0, xs)
  end

(* Exercise 9 *)
fun what_month(day : int) =
  let 
    val months = [31,28,31,30,30,30,31,31,30,31,30,31] 
  in 
    number_before_reaching_sum(day, months) + 1
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

(* Exercise 12 *)
fun number_in_months_challenge(dates: (int * int * int) list, xs : int list) =
  let
    fun is_contain_month(dates : (int * int * int) list, month : int) =
      if null dates
      then false
      else if (month = date_month(hd dates))
        then true   
        else is_contain_month(tl dates, month)

    fun filter(xs: (int * int * int) list, xy: (int * int * int) list) =
      if null xs
      then xy
      else if is_contain_month(xy, date_month(hd xs))
        then filter(tl xs, xy)
        else filter(tl xs, hd xs :: xy)

    fun remove_duplicates(xs: (int * int * int) list) = filter(xs, [])
  in
    number_in_months(remove_duplicates(dates), xs)
  end

fun dates_in_months_challenge(dates : (int * int * int) list, xs : int list) =
  let
    fun contains(xs : int list, n : int) = 
      if null xs
      then false
      else if n = (hd xs)
        then true
        else contains(tl xs, n)

      fun filter(xs : int list, xy : int list) =
        if null xs
        then xy
        else if contains(xy, (hd xs))
          then filter(tl xs, xy)
          else filter(tl xs, hd xs :: xy)

    fun remove_duplicates(xs: int list) = filter(xs, []) 
  in
    dates_in_months(dates, remove_duplicates(xs))
  end

(* Exercise 13 *)

fun reasonable_date(date : (int * int * int)) =
  let
    fun validate_year(year : int) = year > 0

    fun validate_month(month : int) = (month >= 1) andalso (month <= 12)

    fun is_leap_year(year : int) =
      let
        fun divisible_by_400() = year mod 400 = 0
        fun divisible_by_4() = year mod 4 = 0
        fun divisible_by_100() = year mod 100 = 0 
      in
        divisible_by_400() orelse (divisible_by_4() andalso not(divisible_by_100()))
      end
      
    fun get_nth(xs : int list, n : int) = 
      if n = 1
      then (hd xs)
      else get_nth(tl xs, n - 1)

    fun days_in_month(month : int, year : int) = 
      let
        val calendar = [31,28,31,30,31,30,31,31,30,31,30,31]
        val leap_calendar = [31,29,31,30,31,30,31,31,30,31,30,31]
      in
        if is_leap_year year
        then get_nth(leap_calendar, month)
        else get_nth(calendar, month)
      end

    fun validate_day(day : int, month : int, year : int) = 
      day > 0 andalso day <= days_in_month(month, year)
  in
    validate_year(date_year date) 
    andalso validate_month(date_month date)
    andalso validate_day(date_day date, date_month date, date_year date)
  end
