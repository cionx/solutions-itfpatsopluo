# Exercise 2.6.3

> For each of the following simple expressions `e` construct a derivation `E ⊢ e : t`.
> Use the placeholders `t1`, `t2`, `t3`, `t4` for types to avoid unnecessary commitments to concrete types.
> Try to give most general types.
> 1. `f x`
> 2. `f x (g x) y`
> 3. `λ x : t1. λ y : t2. x`
> 4. `λ x : t1. λ x : t2. x`
> 5. `λ x : t. f x (g x) y`
> 6. `if x then y else z`
> 7. `if x then y else x`
> 8. `if x then y + 0 else z`

---

### 1.

In the environment `E := [f : t1 → t2, x : t1]` we have the following type derivation:
```text
-----------------     ------------
E  ⊢  f : t1 → t2     E  ⊢  x : t1
----------------------------------
          E  ⊢  f x : t2
```

### 2.

In the environment
```
E := [f : t1 → t2 → t3 → t4, g : t1 → t2, x : t1, y : t3]
```
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

### 3.

We have the following type derivation for `λ (x : t1). λ (y : t2). x`:
```text
         -------------------------
         x : t1, y : t2  ⊢  x : t1
     ----------------------------------
     x : t1  ⊢  λ (y : t2). x : t2 → t1
----------------------------------------------
[]  ⊢ λ (x : t1). λ (y : t2). x : t1 → t2 → t1
```

### 4.

We have the following type derivation for `λ (x : t1). λ (x : t2). x`:
```text
             -----------------
             x : t2  ⊢  x : t2
     ----------------------------------
     x : t1  ⊢  λ (x : t2). x : t2 → t2
----------------------------------------------
[]  ⊢ λ (x : t1). λ (x : t2). x : t1 → t2 → t2
```

### 5.

We have with
```
E := [f : t → t1 → t2 → t3, g : t → t1, x : t, y : t2]
```
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

### 6.

We have the following type derivation for `if x then y else z` in the environment `E := [x : bool, y : t, z : t]`:
```text
--------------     -----------     -----------
E  ⊢  x : bool     E  ⊢  y : t     E  ⊢  z : t
----------------------------------------------
         E ⊢ (if x then y else z) : t
```

### 7.

We have the following type derivation for `if x then y else x` in the environment `E := [x : bool, y : bool]`:
```text
--------------     --------------     --------------
E  ⊢  x : bool     E  ⊢  y : bool     E  ⊢  x : bool
----------------------------------------------------
            E ⊢ (if x then y else z) : bool
```

### 8.

We have the following derivation for `if x then y + 0 else z` in the environment
```
E := [x : bool, y : int, z : int, + : int  → int → int]
```
```text
                   -------------------------     -------------     -------------
                   E  ⊢  + : int → int → int     E  ⊢  y : int     E  ⊢  0 : int
--------------     -------------------------------------------------------------     -------------
E  ⊢  x : bool                           E  ⊢  y + 0 : int                           E  ⊢  z : int
--------------------------------------------------------------------------------------------------
                               E  ⊢  (if x then y + 0 else z) : int
```
