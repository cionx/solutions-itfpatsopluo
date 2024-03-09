# Exercise 2.3.1

> Give all derivations for $5 \mathbin{\dot{<}} 9$.

---

We distinguish between three kinds of derivations, depending on the premises for the final conclusion $5 \mathbin{\dot{<}} 9$:
- $5 \mathbin{\dot{<}} 6 \mathbin{\dot{<}} 9$
- $5 \mathbin{\dot{<}} 7 \mathbin{\dot{<}} 9$
- $5 \mathbin{\dot{<}} 8 \mathbin{\dot{<}} 9$

(We are going to use the ASCII symbol `<` for $\mathbin{\dot{<}}$.)

### Case $5 \mathbin{\dot{<}} 6 \mathbin{\dot{<}} 9$

Derivations of this kind correspond bijectively to derivations of $6 \mathbin{\dot{<}} 9$, of which there are two:
```text
        -----   -----                                   -----   -----
        6 < 7   7 < 8                                   7 < 8   8 < 9
        -------------   -----                   -----   -------------
            6 < 8       8 < 9                   6 < 7       7 < 9
-----   ----------------------          -----   ----------------------
5 < 6           6 < 9                   5 < 6           6 < 9
------------------------------          ------------------------------
            5 < 9                                   5 < 9
```

### Case $5 \mathbin{\dot{<}} 7 \mathbin{\dot{<}} 9$

There is one such derivation:
```text
-----   -----   -----   -----
5 < 6   6 < 7   7 < 8   8 < 9
-------------   -------------
    5 < 7           7 < 9
------------------------------
            5 < 9
```

### Case $5 \mathbin{\dot{<}} 8 \mathbin{\dot{<}} 9$

Derivations of this kind correspond bijectively to derivations of $5 \mathbin{\dot{<}} 8$, of which there are two:
```text
-----   -----                                  -----   -----
5 < 6   6 < 7                                  6 < 7   7 < 8
-------------   -----                  -----   -------------
    5 < 7       7 < 8                  5 < 6       6 < 8
---------------------   -----          ---------------------   -----
        5 < 8           8 < 9                  5 < 8           8 < 9
-----------------------------          -----------------------------
            5 < 9                                  5 < 9
```
