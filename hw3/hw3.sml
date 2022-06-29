exception NoAnswer

(**** you can put all your code here ****)

(* Exercise 1 *)
fun sub_first s = String.sub(s, 0)
val is_first_char_capital = Char.isUpper o sub_first  
fun only_capitals xs = List.filter is_first_char_capital xs

(* Exercise 2 *)
fun longest_string1 xs = 
  foldl (fn (acc, x) => if String.size(x) >= String.size(acc) then x else acc) "" xs

(* Exercise 3 *)
fun longest_string2 xs =
  foldl (fn (acc, x) => if String.size(x) > String.size(acc) then x else acc) "" xs

(* Exercise 4 *)

fun longest_string_helper reducer lst =
  List.foldl (fn (p, i) => if reducer (String.size p, String.size i) then p else i) "" lst


val longest_string3 = longest_string_helper (fn (p, i) => p > i)

val longest_string4 = longest_string_helper (fn (p, i) => p >= i)

(* Exercise 5 *)
val longest_capitalized = longest_string3 o only_capitals

(* Exercise 6 *)
val rev_string = String.implode o List.rev o String.explode

(* Exercise 7 *)
fun first_answer f xs =  
  case xs of
       [] => raise NoAnswer
     | x::xs' => if isSome(f x)
                 then valOf(f x)
                 else first_answer f xs'

(* Exercise 8 *)
fun all_answers f xs =
  case xs of
       [] => SOME []
     | _ => if List.all isSome (List.map f xs)
            then SOME xs
            else NONE

datatype pattern = Wildcard
                 | Variable of string
                 | UnitP
                 | ConstP of int
                 | TupleP of pattern list
                 | ConstructorP of string * pattern

datatype valu = Const of int
              | Unit
              | Tuple of valu list
              | Constructor of string * valu

fun g f1 f2 p =
    let val r = g f1 f2 
    in
      case p of
           Wildcard          => f1 ()
         | Variable x        => f2 x
         | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
         | ConstructorP(_,p) => r p
         | _                 => 0
    end

(* Exercise 9a *)
val count_wildcards = g (fn _ => 1) (fn _ => 0)     

(* Exercise 9b *)
val count_wild_and_variable_lengths = g (fn _ => 1) (fn s => String.size s)

(* Exercise 9c *)
fun count_some_var (name, p) = g (fn _ => 0) (fn n => if n = name then 1 else 0) p

(* Exercise 10 *)
fun convert_to_list p = 
  case p of
      Wildcard => []
    | Variable x => [x]
    | TupleP ps => List.foldl (fn (p,i) => (convert_to_list p) @ i) [] ps
    | ConstructorP(_,p) => convert_to_list p
    | _  => []

fun no_duplicates n xs = List.length(List.filter (fn x => x = n) xs) = 1 

fun check_pat p = 
  let val xs = convert_to_list p
  in
    List.all (fn x => no_duplicates x xs) xs
  end

(* Exercise 11 *)                 




