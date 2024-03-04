(** From the book. *)

let rec foldl f l b =
  match l with
  | [] -> b
  | a :: l -> foldl f l (f a b)



(** For this exercise. *)

let length l = foldl (fun x a -> 1 + a) l 0

let rev l = foldl (fun x a -> x :: a) l []

let concat l1 l2 = foldl (fun x a -> a @ [x]) l2 l1
