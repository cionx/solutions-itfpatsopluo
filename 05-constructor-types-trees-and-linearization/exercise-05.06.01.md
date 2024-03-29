# Exercise 5.6.1

> Recall the binding rules from Figure 2.3.
> 1. Declare a function `L(var) → exp → bool` that checks whether a binding judgment `X ⊢ e` is derivable.
> 2. Declare a function `exp → bool` that checks whether an expression is closed.
> 3. Declare a function `exp → L(var)` that yields a list containing the free variables of an expression.

---

### 1.

We can declare this function as follows in OCaml:
```ocaml
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
```

### 2.

An expression `e` is closed if and only if it contains no free variables, if and only if every free variable in `e` is contained in the empty set `{}`, if and only if `{} ⊢ e`.
We can therefore use the following test:
```ocaml
let closed e =
  derive [] e
```

### 3.

We declare the function `free` as follows:
```text
                       free : exp → L(var)
                       free x  :=  {x}
                       free c  :=  {}
               free (e1 o e2)  :=  free e1 + free e2
                 free (e1 e2)  :=  free e1 + free e2
 free (if e1 then e2 else e3)  :=  free e1 + free e2 + free e3
                free (λ x. e)  :=  free e - {x}
      free (let x = e1 in e2)  :=  free e1 + (free e2 - {x})
free (let rec f x = e1 in e2)  :=  (free e1 - {f, x}) + (free e2 - {f})
```
In terms of OCaml code, we implement sets as non-repeating lists:
```ocaml
let mem = List.mem

let rec insert x s =
  if mem x s then s else x :: s

let union s1 s2 =
  List.fold_right insert s1 s2

let rec remove x s =
  List.filter (fun y -> x <> y) s
```
We can then declare `free` in OCaml code as follows:
```ocaml
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
```
