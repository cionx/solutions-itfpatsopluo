(** From the textbook. *)

let split l =
  let rec loop l l1 l2 =
    match l with
    | [] -> (l1, l2)
    | [x] -> (x :: l1, l2)
    | x :: y :: l -> loop l (x :: l1) (y :: l2)
  in
  loop l [] []



(** For this exercies. *)

let merge l1 l2 =
  let rec loop l1 l2 acc = match l1, l2 with
    | l1, [] -> List.rev acc @ l1
    | [], l2 -> List.rev acc @ l2
    | x :: l1, y :: l2 ->
      if x < y then loop l1 (y :: l2) (x :: acc)
      else if x > y then loop (x :: l1) l2 (y :: acc)
      else loop l1 l2 (x :: acc)
  in
  loop l1 l2 []

let rec sort l = match l with
  | [] -> []
  | [x] -> [x]
  | l ->
    let (l1, l2) = split l in
    merge (sort l1) (sort l2)
