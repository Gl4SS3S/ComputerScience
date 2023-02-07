(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw

exception IllegalMove

(* put your solutions for problem 2 *)

fun all_except_option tuple =
    let
        fun compare (values, is_in_list) =
            case values of
                (w, []) => []
              | (w, x::xs) => case same_string(w, x) of
                                   true => compare((w, xs), true)
                                 | false => x::compare((w, xs), false)
    in
        compare(tuple, false)
    end

fun get_substitutions1 (word_lists, word) =
    case word_lists of
        x::xs => all_except_option(word, x) @ get_substitutions1 (xs, word)
      | _ => []

fun similar_names ([], name) =