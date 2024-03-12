(** From the problem statement *)

type var = string
type exp = Var of var | Let of var * exp * exp



(** For this exercise. *)

type 'a env = (string * 'a) list

let rec lookup (env : 'a env) x = match env with
  | [] -> None
  | (x', v') :: env ->
    if x = x' then Some v' else lookup env x

let rec update (env : 'a env) x v : 'a env =
  (x, v) :: env

let rec check env exp =
  match exp with
  | Var x -> lookup env x
  | Let (x, e1, e2) ->
    match check env e1 with
    | None -> None
    | Some t1 ->
      check (update env x t1) e2
