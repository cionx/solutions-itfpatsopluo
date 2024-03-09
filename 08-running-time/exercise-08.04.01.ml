(** From the textbook. *)

let rec split l l1 l2 =
  match l with
  | [] -> (l1, l2)
  | [x] -> (x :: l1, l2)
  | x :: y :: l -> split l (x :: l1) (y :: l2)

let rec merge l1 l2 = match l1, l2 with
  | [], l2 -> l2
  | l1, [] -> l1
  | x :: l1, y :: l2 when x <= y ->
    x :: merge l1 (y :: l2)
  | x :: l1, y :: l2 ->
    y :: merge (x :: l1) l2

let rec msort l = match l with
  | [] -> []
  | [x] -> [x]
  | l ->
    let (l1, l2) = split l [] [] in
    merge (msort l1) (msort l2)



(** For this exercise. *)

let enum i j =
  let rec helper i j acc =
    if i > j then acc else helper i (j - 1) (j :: acc)
  in
  helper i j []

let rand_list n =
  let rec helper k acc =
    if k = 0 then acc else helper (k - 1) (Random.int n :: acc)
  in
  helper n []

let time f x =
  let t1 = Sys.time () in
  let _ = f x in
  let t2 = Sys.time () in
  t2 -. t1

let len = 10_000_000
let l_asc = enum 0 len
let l_desc = List.rev l_asc
let l_rand = rand_list len
