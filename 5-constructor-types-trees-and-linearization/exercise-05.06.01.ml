(** From the textbook. *)

type var = string
type con = Bcon of bool | Icon of int
type op = Add | Sub | Mul | Leq
type exp =
  | Var of var
  | Con of con
  | Oapp of op * exp * exp
  | Fapp of exp * exp
  | If of exp * exp * exp
  | Lam of var * exp
  | Let of var * exp * exp
  | Letrec of var * var * exp * exp



(** For this exercise. *)

let rec derive l e =
  match e with
  | Var x -> List.mem x l
  | Con c -> true
  | Oapp (_, e1, e2) ->
    derive l e1 && derive l e2
  | Fapp (e1, e2) ->
    derive l e1 && derive l e2
  | If (e1, e2, e3) ->
    derive l e1 && derive l e2 && derive l e3
  | Lam (x, e) ->
    derive (x :: l) e
  | Let (x, e1, e2) ->
    derive l e1 && derive (x :: l) e2
  | Letrec (f, x, e1, e2) ->
    derive (f :: x :: l) e1 && derive (f :: l) e2



let closed e =
  derive [] e



let mem = List.mem

let rec insert x s =
  if mem x s then s else x :: s

let union s1 s2 =
  List.fold_right insert s1 s2

let rec remove x s =
  List.filter (fun y -> x <> y) s

let rec frees e =
  match e with
  | Var x -> [x]
  | Con _ -> []
  | Oapp (_, e1, e2) ->
    union (frees e1) (frees e2)
  | Fapp (e1, e2) ->
    union (frees e1) (frees e2)
  | If (e1, e2, e3) ->
    union (frees e1) (union (frees e2) (frees e3))
  | Lam (x, e) ->
    remove x (frees e)
  | Let (x, e1, e2) ->
    union (frees e1) (remove x (frees e2))
  | Letrec (f, x, e1, e2) ->
    union (remove f (remove x (frees e1))) (remove f (frees e2))
