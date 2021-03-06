fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* Exercise 1a *)
fun all_except_option(s : string, xs : string list) =
  let fun is_string_in_list(s : string, xs : string list) =
        case xs of
          [] => false
        | x::xs' => if same_string(s, x)
                    then true
                    else is_string_in_list(s, xs')

      fun list_without_string(s : string, xs : string list) = 
        case xs of
             [] => []
           | x::xs' => if same_string(s, x)
                      then list_without_string(s, xs')
                      else x::list_without_string(s, xs')
  in 
    if is_string_in_list(s, xs)
    then SOME(list_without_string(s, xs))
    else NONE
  end

(* Exercise 1b *)
fun get_substitutions1(xs : string list list, s : string) =
  case xs of
       [] => []
     | x::xs' => if isSome(all_except_option(s, x))
                 then valOf(all_except_option(s, x)) @ get_substitutions1(xs', s) 
                 else get_substitutions1(xs', s)

(* Exercise 1c *)
fun get_substitutions2(xs : string list list, s : string) =
  let 
    fun f(xs: string list list, acc: string list) =
      case xs of
        [] => acc
      | x::xs' => if isSome(all_except_option(s, x))
                  then f(xs', acc @ valOf(all_except_option(s, x)))
                  else f(xs', acc) 
  in
    f(xs, [])
  end

(* Exercise 1d *)
fun similar_names(xs : string list list, {first=first_name, middle=middle_name, last=last_name}) =
  let fun get_similar_names(xs : string list) = 
        case xs of
             [] => []
           | x::xs' => {first=x, middle=middle_name,
           last=last_name}::get_similar_names(xs')
  in
    get_similar_names(first_name::get_substitutions1(xs, first_name))
  end

datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* Exercise 2a *)
fun card_color(clubs : suit, num : rank) =
  case clubs of
       Spades => Black
     | Clubs => Black
     | Diamonds => Red
     | Heards => Red

(* Exercise 2b *)
fun card_value(clubs : suit, num : rank) = 
  case num of
       Num n => n
     | Ace => 11
     | _ => 10 

(* Exercise 2c *)
fun remove_card(cs : card list, card : card, e) =
  let fun is_card_in_list(cs) =
        case cs of
          [] => false
        | c::cs' => if c = card
                    then true
                    else is_card_in_list(cs')

    fun remove_card_from_list(cs, acc) =
        case cs of
          [] => acc
        | c::cs' => if c = card 
                    then acc @ cs' 
                    else remove_card_from_list(cs', acc @ [c])
  in
    if is_card_in_list(cs)
    then remove_card_from_list(cs, [])
    else raise e
  end

(* Exercise 2d *)
fun all_same_color(cs : card list) =
  case cs of
      [] => true
    | _::[] => true 
    | head::(neck::rest) => card_color(head) = card_color(neck) 
                            andalso all_same_color(neck::rest)

(* Exercise 2e *)
fun sum_cards(cs : card list) = 
  let fun sum(cs, n) =
        case cs of
             [] => n
           | c::cs' => sum(cs', n + card_value(c)) 
  in
    sum(cs, 0)
  end

(* Exercise 2f *)
fun score(cs : card list, goal : int) =
  let fun calculate_score(sum) = 
      if sum > goal
      then 3 * (sum - goal)
      else goal - sum
  in
    if all_same_color(cs)
    then calculate_score(sum_cards(cs)) div 2
    else calculate_score(sum_cards(cs))
  end

(* Exercise 2g *)
fun officiate(card_list : card list, move_list : move list, goal : int) =
  let fun play(held_cards, card_list, move_list) =
        case move_list of
          [] => score(held_cards, goal)
        | m::move_list' => 
          case m of
            Discard c => play(remove_card(held_cards, c, IllegalMove), card_list, move_list') 
          | Draw => case card_list of
                      [] => score(held_cards, goal)
                    | c::card_list' => if sum_cards(c::held_cards) > goal
                                       then play(c::held_cards, card_list', [])
                                       else play(c::held_cards, card_list', move_list')
  in
    play([], card_list, move_list)
  end

