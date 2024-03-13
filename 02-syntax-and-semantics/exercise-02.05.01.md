# Exercise 2.5.1

> For each of the following expressions `e` construct a derivation `[] ⊢ e : t`.
> Use the placeholders `t1`, `t2`, `t3` for types to avoid unnecessary commitments to concrete types.
> Try to give most general types.
> 1. `λ x. x`
> 2. `λ x y. x`
> 3. `λ x x. x`
> 4. `λ f g x. f x (g x)`
> 5. `let rec f x = f x in f`
> 6. `λ x y z. if x then y else z`

---

### 1.

We have the following type derivation:
```text
   -----------------
   x : t1  ⊢  x : t1
-----------------------
[]  ⊢  λ x. x : t1 → t1
```

We can verify our result with utop:
```ocaml
# fun x -> x;;
- : 'a -> 'a = <fun>
```

### 2.

The expression `λ x y. x` desugars to `λ x. λ y. x`.
It has the following type derivation:
```text
    -------------------------
    x : t1, y : t2  ⊢  x : t1
   ---------------------------
   x : t1  ⊢  λ y. x : t2 → t1
---------------------------------
[]  ⊢  λ x. λ y. x : t1 → t2 → t1
```

We can verify our result with utop:
```ocaml
# fun x y -> x;;
- : 'a -> 'b -> 'a = <fun>
```

### 3.

The expression `λ x x. x` desugars to `λ x. λ x. x`.
It has the following type derivation:
```text
        -----------------
        x : t2  ⊢  x : t2
   ---------------------------
   x : t1  ⊢  λ x. x : t2 → t2
---------------------------------
[]  ⊢  λ x. λ x. x : t1 → t2 → t2
```

We can verify our result with utop:
```ocaml
# fun x x -> x;;
- : 'a -> 'b -> 'b = <fun>
```

### 4.

The expression `λ f g x. f x (g x)` desugars to `λ f. λ g. λ x. (f x) (g x)`.
We observe that
- if `x` has type `t1`,
- then `g` has type `t1 → t2`,
- then `f x` has type `t2 → t3`,
- then `f` has type `t1 → t2 → t3`.

Let therefore `E` be the environment `[ x : t1, g : t1 → t2, f : t1 → t2 → t3 ]`.
We have the following type derivation:
```text
----------------------     ------------     -----------------     ------------
E  ⊢  f : t1 → t2 → t3     E  ⊢  x : t1     E  ⊢  g : t1 → t2     E  ⊢  x : t1
---------------------------------------     ----------------------------------
         E  ⊢  f x : t2 → t3                          E  ⊢  g x : t2
------------------------------------------------------------------------------
                              E  ⊢  (f x) (g x) : t3
                                      i.e.
        [ x : t1, g : t1 → t2, f : t1 → t2 → t3 ]  ⊢  (f x) (g x) : t3
------------------------------------------------------------------------------
       [ g : t1 → t2, f : t1 → t2 → t3 ]  ⊢  λ x. (f x) (g x) : t1 → t3
------------------------------------------------------------------------------
     [ f : t1 → t2 → t3 ]  ⊢  λ g. λ x. (f x) (g x) : (t1 → t2) → t1 → t3
------------------------------------------------------------------------------
   []  ⊢  λ f. λ g. λ x. (f x) (g x) : (t1 → t2 → t3) → (t1 → t2) → t1 → t3
```

We can verify our result with utop:
```ocaml
# fun f g x -> f x (g x);;
- : ('a -> 'b -> 'c) -> ('a -> 'b) -> 'a -> 'c = <fun>
```

### 5.

The expression `let rec f x = f x in f` has the following derivation, where `E` denotes the environment `[f : t1 → t2, x : t1]`
```text
-----------------     ------------
E  ⊢  f : t1 → t2     E  ⊢  x : t1
----------------------------------
           E ⊢ f x : t2
                i.e.                   -----------------------------
[f : t1 → t2, x : t1]  ⊢  f x : t2     [f : t1 → t2]  ⊢  f : t1 → t2
--------------------------------------------------------------------
              []  ⊢  let rec f x = f x in f : t1 → t2
```

We can verify our result with utop:
```ocaml
# let rec f x = f x in f;;
- : 'a -> 'b = <fun>
```

### 6.

The expression `λ x y z. if x then y else z` desugars to `λ x. λ y. λ z. if x then y else z`.
It has the following type derivation, where `E` denotes the environment `[x : bool, y : t, z : t]`:
```text
     --------------     -----------     -----------
     E  ⊢  x : bool     E  ⊢  y : t     E  ⊢  z : t
    -------------------------------------------------
               E ⊢ if x then y else z : t
                          i.e.
    [x : bool, y : t, z : t] ⊢ if x then y else z : t
   ---------------------------------------------------
   [x : bool, y : t] ⊢ λ z. if x then y else z : t → t
  -----------------------------------------------------
  [x : bool] ⊢ λ y. λ z. if x then y else z : t → t → t
---------------------------------------------------------
[] ⊢ λ x. λ y. λ z. if x then y else z : bool → t → t → t
```

We can verify our result with utop:
```ocaml
# fun x y z -> if x then y else z;;
- : bool -> 'a -> 'a -> 'a = <fun>
```
