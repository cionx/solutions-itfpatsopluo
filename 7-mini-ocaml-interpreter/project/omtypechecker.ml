open Omtypes
open Omenvs

let check_op o t1 t2 =
  match o, t1, t2 with
  | Add, Int, Int -> Int
  | Sub, Int, Int -> Int
  | Mul, Int, Int -> Int
  | Leq, Int, Int -> Bool
  | _ -> failwith "operation: wrong types"

let check_fun tfun tin =
  match tfun with
  | Arrow (t1, t2) when t1 = tin -> t2
  | _ -> failwith "app: incompatible types"

let check_if t1 t2 t3 =
  if t1 <> Bool then failwith "if: guard must have type bool"
  else if t2 <> t3 then failwith "if: incompatible branch types"
  else t2

let rec check env e : ty = match e with
  | Var x -> begin
    match lookup env x with
    | Some t -> t
    | None -> failwith "variable: missing type"
    end
  | Con (Bcon b) -> Bool
  | Con (Icon b) -> Int
  | Oapp (o, e1, e2) ->
    check_op o (check env e1) (check env e2)
  | Fapp (e1, e2) ->
    check_fun (check env e1) (check env e2)
  | If (e1, e2, e3) ->
    check_if (check env e1) (check env e2) (check env e3)
  | Lam _ -> failwith "fun: missing type"
  | Lamty (x, t, e) ->
    let t' = check (update env x t) e in
    Arrow (t, t')
  | Let (x, e1, e2) ->
    let t = check env e1 in
    check (update env x t) e2
  | Letrec _ -> failwith "let rec: missing types"
  | Letrecty (f, x, t1, t2, e1, e2) -> (* syntax: let rec f (x : t1) : t2 = ... *)
    let t2' = check (update (update env x t1) f (Arrow (t1, t2))) e1 in
    if t2 <> t2' then failwith "let rec: inconsistent types"
    else check (update env f (Arrow (t1, t2))) e2
