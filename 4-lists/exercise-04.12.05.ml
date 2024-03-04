(** From a previous exercise. *)

let rec count' x l acc =
  match l with
  | [] -> acc
  | h :: t -> count' x t (if h = x then acc + 1 else acc)

let count x l =
  count' x l 0

(** From a previous exercise. *)

let rec makeset l =
  match l with
  | [] -> []
  | x :: l ->
    let l' = makeset l in
    if List.mem x l' then l' else x :: l'



(** For this exercise. *)

let table l =
  let keys = List.rev (makeset l) in
  List.map (fun key -> (key, count key l)) keys
