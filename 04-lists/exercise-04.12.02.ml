(** From the book. *)

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

let perm l1 l2 =
  (isort l1) = (isort l2)
