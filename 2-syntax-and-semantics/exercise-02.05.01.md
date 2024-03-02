# Exercise 2.5.1

> For each of the following expressions $e$ construct a derivation $[] \vdash e : t$.
> Use the placeholders $t_1$, $t_2$, $t_3$ for types to avoid unnecessary commitments to concrete types.
> Try to give most general types.  
> a) $\lambda x. x$  
> b) $\lambda x y. x$  
> c) $\lambda x x. x$  
> d) $\lambda f g x. f x (g x)$  
> e) $\text{let rec } f x = f x \text{ in } f$  
> f) $\lambda x y z. \text{ if } x \text{ then } y \text{ else } z$

---

### a)

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

### b)

The expression $\lambda x y. x$ desugars to $\lambda x. \lambda y. x$.
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

### c)

The expression $\lambda x x. x$ desugars to $\lambda x. \lambda x. x$.
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

### d)

The expression $\lambda f g x. f x (g x)$ desugars to $\lambda f. \lambda g. \lambda x. (f x) (g x)$.
We observe that
- if $x$ has type $t_1$,
- then $g$ has type $t_1 \to t_2$,
- then $f x$ has type $t_2 \to t_3$,
- then $f$ has type $t_1 \to t_2 \to t_3$.

Let therefore $E$ be the environment $[ x : t_1, g : t_1 \to t_2, f : t_1 \to t_2 \to t_3 ]$.
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

### e)

The expression $\text{let rec } f x = f x \text{ in } f$ has the following derivation, where $E$ denotes the environment $[f : t_1 \to t_2, x : t_1]$
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

### f)

The expression $\lambda x y z. \text{ if } x \text{ then } y \text{ else } z$ desugars to $\lambda x. \lambda y. \lambda z. \text{ if } x \text{ then } y \text{ else } z$.
It has the following type derivation, where $E$ denotes the environment $[x : \mathit{bool}, y : t, z : t]$:
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
