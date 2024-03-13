(** From the exercise statement. *)

type var = string
type exp = Con of int | Var of var | Lam of var * exp | App of exp * exp

(** Background code. *)

type 'a env = (string * 'a) list

let rec lookup (env : 'a env) x =
  match env with
  | [] -> None
  | (x', v') :: env ->
    if x = x' then Some v' else lookup env x

let update (env : 'a env) x v : 'a env =
  (x, v) :: env

type value = Int of int | Clo of var * exp * value env



(** For the exercise. *)

let rec closed l e =
  match e with
  | Con _ -> true
  | Var x -> List.mem x l
  | Lam (x, e) -> closed (x :: l) e
  | App (e1, e2) -> closed l e1 && closed l e2

let rec eval (env : value env) e =
  match e with
  | Con i -> Int i
  | Var x -> begin
    match lookup env x with
    | None -> failwith "eval"
    | Some v -> v
    end
  | Lam (x, e) ->
    Clo (x, e, env)
  | App (e1, e2) -> begin
    match eval env e1, eval env e2 with
    | Clo (x, e, env), v2 ->
      eval (update env x v2) e
    | _ -> failwith "eval"
    end
