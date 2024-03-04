(** From the textbook. *)

let rec foldl f l b =
  match l with
  | [] -> b
  | x :: l -> foldl f l (f x b)

let gisort p l =
  let rec insert x l =
    match l with
    | [] -> [x]
    | y :: l -> if p x y then x :: y :: l else y :: insert x l
  in
  foldl insert l []



(** For this exercise. *)

let reorder l =
  gisort (fun (x, _) (y, _) -> x <= y) (List.rev l)
