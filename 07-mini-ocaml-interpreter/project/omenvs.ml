open Omtypes

let empty : ('a, 'b) env = []

let update (env : ('a, 'b) env) a b : ('a, 'b) env = (a, b) :: env

let rec lookup (env : ('a, 'b) env) a =
  match env with
  | (a', b') :: env -> if a = a' then Some b' else lookup env a
  | [] -> None
