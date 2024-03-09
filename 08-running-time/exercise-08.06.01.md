# Exercise 8.6.1 (Minimal Trees)

We call an AB-tree of depth $n$ _minimal_ if its size is minimal for all AB-tree of depth $n$.
1. Argue that there are two different minimal AB-trees of depth 2.
2. Declare a linear-time function that given $n$ yields a minimal AB-tree of depth $n$.
3. Declare a linear-time function that given $n$ yields the size of minimal AB-trees of depth $n$.
4. Give an explicit formula for the size of minimal AB-trees of depth $n$.

---

One can show by induction for every $n \geq 1$ that every minimal AB-tree of depth $n$ is of the form $B (t, A)$ or $B(A, t)$ for a minimal AB-tree $t$ of depth $n - 1$.

### 1.

The only tree of depth 0 is $t_0 \coloneqq A$.
Consequently, the only minimal tree of depth 1 is $t_1 \coloneqq B (A, A)$, since both $B (t_0, A) = B (A, A)$ and $B (A, t_0) = B (A, A)$.
Consequently, the only two minimal trees of depth 2 are $B (t_1, A) = B (B (A, A), A)$ and $B (A, t_1) = B (A, B(A, A))$.

### 2.

We can use the following function:
$$
  \begin{gathered}
    \mathit{min} : \mathbb{N} \to \mathit{tree} \,, \\
    \begin{aligned}
      \mathit{min} \enspace 0 &\coloneqq A \,, \\
      \mathit{min} \enspace (n + 1) &\coloneqq B (\mathit{min} \enspace n, A)
    \end{aligned}
  \end{gathered}
$$
In OCaml code:
```ocaml
let rec min n =
 if n = 0 then A else B (min (n - 1), A)
```

### 3. and 4.

We can show by induction that a minimal AB-tree of depth $n$ has size $2 n + 1$.
This expression can be computed in constant time:
$$
  \mathit{min\_size} \enspace n \coloneqq 2 n + 1 \,.
$$
In OCaml code:
```ocaml
let min_size n =
  2 * n + 1
```
