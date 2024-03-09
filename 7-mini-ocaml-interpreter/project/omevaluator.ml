open Omtypes
open Omenvs
open Omlinearizer

let eval_op o v1 v2 =
  match o, v1, v2 with
  | Add, Ival x, Ival y -> Ival (x + y)
  | Sub, Ival x, Ival y -> Ival (x - y)
  | Mul, Ival x, Ival y -> Ival (x * y)
  | Leq, Ival x, Ival y -> Bval (x <= y)
  | _ -> failwith "eval_op: operation not implemented"

let rec eval env e : value = match e with
  | Var x -> begin
    match lookup env x with
    | Some v -> v
    | None -> failwith ("eval: missing value for variable " ^ x)
    end
  | Con (Bcon b) -> Bval b
  | Con (Icon n) -> Ival n
  | Oapp (o, e1, e2) ->
    eval_op o (eval env e1) (eval env e2)
  | Fapp (e1, e2) ->
    eval_fun (eval env e1) (eval env e2)
  | If (e1, e2, e3) -> begin
    match eval env e1 with
    | Bval true -> eval env e2
    | Bval false -> eval env e3
    | _ -> failwith "eval_if: wrong guard"
    end
  | Lam (x, e) | Lamty (x, _, e) -> Closure (x, e, env)
  | Let (x, e1, e2) ->
    eval (update env x (eval env e1)) e2
  | Letrec (f, x, e1, e2) | Letrecty (f, x, _, _, e1, e2) ->
    let cl = Rclosure (f, x, e1, env) in
    eval (update env f cl) e2
and eval_fun cl v =
  match cl with
  | Closure (x, e, env) ->
    eval (update env x v) e
  | Rclosure (f, x, e, env) ->
    eval (update (update env f cl) x v) e
  | _ -> failwith "eval_fun: try to apply a non-function"
