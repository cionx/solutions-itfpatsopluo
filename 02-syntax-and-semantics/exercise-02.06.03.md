# Exercise 2.6.3

> For each of the following simple expressions $e$ construct a derivation $E \vdash e : t$.
> Use the placeholders $t_1$, $t_2$, $t_3$, $t_4$ for types to avoid unnecessary commitments to concrete types.
> Try to give most general types.  
> a) $f x$  
> b) $f x (g x) y$  
> c) $\lambda x : t_1. \lambda y : t_2. x$  
> d) $\lambda x : t_1. \lambda x : t_2. x$  
> e) $\lambda x : t. f x (g x) y$  
> f) $\text{if } x \text{ then } y \text{ else } z$  
> g) $\text{if } x \text{ then } y \text{ else } x$  
> h) $\text{if } x \text{ then } y + 0 \text{ else } z$  

---

### a)

In the environment $E \coloneqq [f : t_1 \to t_2, x : t_1]$ we have the following type derivation:
```text
-----------------     ------------
E  ⊢  f : t1 → t2     E  ⊢  x : t1
----------------------------------
          E  ⊢  f x : t2
```

### b)

In the environment
$$
  E \coloneqq [f : t_1 \to t_2 \to t_3 \to t_4, g : t_1 \to t_2, x : t_1, y : t_3]
$$
we have the following type derivation:
```text
---------------------------     ------------     -----------------     ------------
E  ⊢  f : t1 → t2 → t3 → t4     E  ⊢  x : t1     E  ⊢  g : t1 → t2     E  ⊢  x : t1
--------------------------------------------     ----------------------------------
          E  ⊢  f x : t2 → t3 → t4                         E  ⊢  g x : t2
-----------------------------------------------------------------------------------     ------------
                              E ⊢ f x (g x) : t3 → t4                                   E  ⊢  y : t3
----------------------------------------------------------------------------------------------------
                                       E  ⊢  f x (g x) y : t4
```

### c)

We have the following type derivation for $\lambda (x : t_1). \lambda (y : t_2). x$:
```text
         -------------------------
         x : t1, y : t2  ⊢  x : t1
     ----------------------------------
     x : t1  ⊢  λ (y : t2). x : t2 → t1
----------------------------------------------
[]  ⊢ λ (x : t1). λ (y : t2). x : t1 → t2 → t1
```

### d)

We have the following type derivation for $\lambda (x : t_1). \lambda (x : t_2). x$:
```text
             -----------------
             x : t2  ⊢  x : t2
     ----------------------------------
     x : t1  ⊢  λ (x : t2). x : t2 → t2
----------------------------------------------
[]  ⊢ λ (x : t1). λ (x : t2). x : t1 → t2 → t2
```

### e)

We have with
$$
  E \coloneqq [f : t \to t_1 \to t_2 \to t_3, g : t \to t_1, x : t, y : t_2]
$$
the following type derivation:
```text
--------------------------     -----------     ----------------     -----------
E  ⊢  f : t → t1 → t2 → t3     E  ⊢  x : t     E  ⊢  g : t → t1     E  ⊢  x : t
------------------------------------------     --------------------------------
         E  ⊢  f x : t1 → t2 → t3                       E  ⊢  g x : t1
-------------------------------------------------------------------------------     ------------
                            E ⊢ f x (g x) : t2 → t3                                 E  ⊢  y : t2
------------------------------------------------------------------------------------------------
                                     E  ⊢  f x (g x) y : t3
------------------------------------------------------------------------------------------------
           [f : t → t1 → t2 → t3, g : t → t1, y : t2]  ⊢  λ (x : t). f x (g x) y : t3
```

### f)

We have the following type derivation for $(\text{if } x \text{ then } y \text{ else } z)$ in the environment $E \coloneqq [x : \mathit{bool}, y : t, z : t]$:
```text
--------------     -----------     -----------
E  ⊢  x : bool     E  ⊢  y : t     E  ⊢  z : t
----------------------------------------------
         E ⊢ (if x then y else z) : t
```

### g)

We have the following type derivation for $(\text{if } x \text{ then } y \text{ else } x)$ in the environment $E \coloneqq [x : \mathit{bool}, y : \mathit{bool}]$:
```text
--------------     --------------     --------------
E  ⊢  x : bool     E  ⊢  y : bool     E  ⊢  x : bool
----------------------------------------------------
            E ⊢ (if x then y else z) : bool
```

### h)

We have the following derivation for $(\text{if } x \text{ then } y + 0 \text{ else } z)$ in the environment
$$
  E \coloneqq [x : \mathit{bool}, y : \mathit{int}, z : \mathit{int}, {+} : \mathit{int}  \to \mathit{int} \to \mathit{int}]
$$
```text
                   -------------------------     -------------     -------------
                   E  ⊢  + : int → int → int     E  ⊢  y : int     E  ⊢  0 : int
--------------     -------------------------------------------------------------     -------------
E  ⊢  x : bool                           E  ⊢  y + 0 : int                           E  ⊢  z : int
--------------------------------------------------------------------------------------------------
                               E  ⊢  (if x then y + 0 else z) : int
```
