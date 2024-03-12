# Let expressions 14P

> We consider expressions consisting of variables and let expressions:
> ```ocaml
> type var = string
> type exp = Var of var | Let of var * exp * exp
> ```
> Note that the expressions considered can be type checked and evaluated in environments without making assumptions about types and values.
> 1. Realize environments with three declarations as follows:
>    ```ocaml
>    type 'a env
>    val lookup : 'a env -> var -> 'a option
>    val update : 'a env -> var -> 'a -> 'a env
>    ```
> 2. Declare a type checker
>    ```ocaml
>    val check : 'a env -> exp -> 'a option
>    ```
>    Do not raise exceptions.
> 3. Can the type checker be used as an evaluator?
>    Answer yes or no.

---

### 1.

We can declare this type and these functions as follows:
```ocaml
type 'a env = (string * 'a) list

let rec lookup (env : 'a env) x = match env with
  | [] -> None
  | (x', v') :: env ->
    if x = x' then Some v' else lookup env x

let rec update (env : 'a env) x v : 'a env =
  (x, v) :: env
```

### 2.

We can declare this function as follows:
```ocaml
let rec check env exp =
  match exp with
  | Var x -> lookup env x
  | Let (x, e1, e2) ->
    match check env e1 with
    | None -> None
    | Some t1 ->
      check (update env x t1) e2
```

### 3.

Yes.
