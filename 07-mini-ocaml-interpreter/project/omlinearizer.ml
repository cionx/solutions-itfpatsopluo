open Omtypes

(** Types *)

let rec lin_ty t = match t with
  | Arrow (t1, t2) ->
    lin_pty t1 ^ " -> " ^ lin_ty t2
  | t -> lin_pty t
and lin_pty t = match t with
  | Int -> "int"
  | Bool -> "bool"
  | t -> "(" ^ lin_ty t ^ ")"

(** Expressions *)

let rec lin_exp e = match e with
  | If (e1, e2, e3) ->
    "if " ^ lin_exp e1 ^ " then " ^ lin_exp e2 ^ " else " ^ lin_exp e3
  | Lam (x, e) ->
    "fun " ^ x ^ " -> " ^ lin_exp e
  | Lamty (x, t, e) ->
    "fun (" ^ x ^ " : " ^ lin_ty t ^ ") -> " ^ lin_exp e
  | Let (x, e1, e2) ->
    "let " ^ x ^ " = " ^ lin_exp e1 ^ " in " ^ lin_exp e2
  | Letrec (f, x, e1, e2) ->
    "let rec " ^ f ^ " " ^ x ^ " = " ^ lin_exp e1 ^ " in " ^ lin_exp e2
  | Letrecty (f, x, t1, t2, e1, e2) ->
    "let rec " ^ f ^ " (" ^ x ^ " : " ^ lin_ty t1 ^ ") : " ^ lin_ty t2 ^ " = " ^ lin_exp e1 ^ " in " ^ lin_exp e2
  | e -> lin_cexp e
and lin_cexp e = match e with
  | Oapp (Leq, e1, e2) ->
    lin_sexp e1 ^ " <= " ^ lin_sexp e2
  | e -> lin_sexp e
and lin_sexp e = match e with
  | Oapp(Add, e1, e2) ->
    lin_sexp e1 ^ " + " ^ lin_mexp e2
  | Oapp(Sub, e1, e2) ->
    lin_sexp e1 ^ " - " ^ lin_mexp e2
  | e -> lin_mexp e
and lin_mexp e = match e with
  | Oapp(Mul, e1, e2) ->
    lin_mexp e1 ^ " * " ^ lin_aexp e2
  | e -> lin_aexp e
and lin_aexp e = match e with
  | Fapp (e1, e2) ->
    lin_aexp e1 ^ " " ^ lin_pexp e2
  | e -> lin_pexp e
and lin_pexp e = match e with
  | Var x -> x
  | Con (Bcon b) -> string_of_bool b
  | Con (Icon i) -> string_of_int i
  | e -> "(" ^ lin_exp e ^ ")"

(** Environments *)

let lin_env lin_a lin_b (env : ('a, 'b) env) =
  let lin_a_b (a, b) =
    "(" ^ lin_a a ^ ", " ^ lin_b b ^ ")"
  in
  "[" ^ (String.concat "; " (List.map lin_a_b env)) ^ "]"

(** Values *)

let rec lin_value v =
  match v with
  | Ival i -> string_of_int i
  | Bval b -> string_of_bool b
  | Closure (x, e, env) ->
    "(" ^ x ^ ", " ^ lin_exp e ^ ", " ^ lin_value_env env ^ ")"
  | Rclosure (f, x, e, env) ->
    "(" ^ f ^ ", " ^ x ^ ", " ^ lin_exp e ^ ", " ^ lin_value_env env ^ ")"
and lin_value_env env = (lin_env Fun.id lin_value) env
