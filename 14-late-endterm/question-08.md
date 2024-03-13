# Expressions 15P

> We consider expressions `e ::= c | x | λ x. e | e1 e2` implemented with the
> declarations
> ```ocaml
> type var = string
> type exp = Con of int | Var of var | Lam of var * exp | App of exp * exp
> ```
> 1. Declare a function
>    ```ocaml
>    closed : var list -> exp -> bool
>    ```
>    that checks whether an expression is closed in a list of variable.
>    For instance, `λ x. f x y` is closed in `[f, y]`.
> 2. Declare a function
>    ```ocaml
>    eval : value env -> exp -> value
>    ```
>    evaluating an expression in an environment.
>    We assume that values and environments are implemented as follows:
>    ```ocaml
>    type 'a env
>    val lookup : 'a env -> var -> 'a option
>    val update : 'a env -> var -> 'a -> 'a env
>    type value = Int of int | Clo of var * exp * value env
>    ```
>    If an expression cannot be evaluated, `eval` should raise an exception with `failwith "eval"`.

---

### 1.

We can declare the function `closed` as follows:
```ocaml
let rec closed l e =
  match e with
  | Con _ -> true
  | Var x -> List.mem x l
  | Lam (x, e) -> closed (x :: l) e
  | App (e1, e2) -> closed l e1 && closed l e2
```

### 2.

We can declare the function `eval` as follows:
```ocaml
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
```
