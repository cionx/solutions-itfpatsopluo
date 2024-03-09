(** From the textbook. *)

let rec fold f l b =
  match l with
  | [] -> b
  | x :: l -> f x (fold f l b)

let rec insert x l =
  match l with
  | [] -> [x]
  | y :: l ->
    if x <= y then x :: y :: l else y :: insert x l

let isort l =
  fold insert l []



(** For this exercise. *)

let rec rm_dup l =
  match l with
  | [] -> []
  | [x] -> [x]
  | x :: y :: l ->
    let l' = rm_dup (y :: l) in
    if x = y then l' else x :: l'

let dsort l =
  rm_dup (isort l)
