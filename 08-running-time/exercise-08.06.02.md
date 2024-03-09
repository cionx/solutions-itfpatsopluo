# Exercise 8.6.2 (Ternary Trees)

> Consider ternary trees as follows:
> $$
>   \mathit{tree} \Coloneqq A \mid B(\mathit{tree}, \mathit{tree}, \mathit{tree})
> $$
> 1. Declare a function that yields the size of ternary trees.
> 2. Declare a function that yields the depth of ternary trees.
> 3. Declare a linear-time function that yields a ternary tree of depth $n$ that has maximal size.
> 4. Declare a linear-time function that yields a ternary tree of depth $n$ that has minimal size.
> 5. Give an explicit formula for the size of maximal ternary trees of depth n.
> 6. Give an explicit formula for the size of minimal ternary trees of depth n.

---

### 1.

We can declare this function as follows:
$$
  \begin{gathered}
    \mathit{size} : \mathit{tree} \to \mathbb{N} \,, \\
    \begin{aligned}
      \mathit{size} \enspace A
      &\coloneqq
      1
      \\
      \mathit{size} \enspace B (t_1, t_2, t_3)
      &\coloneqq
      1 + \mathit{size} \enspace t_1 + \mathit{size} \enspace t_2 + \mathit{size} \enspace t_3
    \end{aligned}
  \end{gathered}
$$
In OCaml code:
```ocaml
let rec size t = match t with
  | A -> 1
  | B (t1, t2, t3) -> 1 + size t1 + size t2 + size t3
```

### 2.

We can declare this function as follows:
$$
  \begin{gathered}
    \mathit{depth} : \mathit{tree} \to \mathbb{N} \,, \\
    \begin{aligned}
      \mathit{depth} \enspace A
      &\coloneqq
      0
      \\
      \mathit{depth} \enspace B (t_1, t_2, t_3)
      &\coloneqq
      1 + \max (\mathit{depth} \enspace t_1, \mathit{depth} \enspace t_2, \mathit{depth} \enspace t_3)
    \end{aligned}
  \end{gathered}
$$
In OCaml code:
```ocaml
let rec depth t = match t with
  | A -> 0
  | B (t1, t2, t3) -> 1 + max (depth t1) (max (depth t2) (depth t3))
```

### 3.

It can be shown by induction that for every $n \geq 0$ there exists a unique maximal ternary AB-tree of depth $n$;
for $n \geq 1$ it is of the form $B (t, t, t)$ where $t$ is the maximal ternary AB-tree of depth $n - 1$.
We can therefore declare the required function as follows:
$$
  \begin{gathered}
    \mathit{max\_tree} : \mathbb{N} \to \mathit{tree} \,, \\
    \begin{aligned}
      \mathit{max\_tree} \enspace 0
      &\coloneqq
      A
      \\
      \mathit{max\_tree} \enspace (n + 1)
      &\coloneqq
      \text{let } t = \mathit{max\_tree} \enspace n \text{ in }
      B (t, t, t)
    \end{aligned}
  \end{gathered}
$$
In OCaml code:
```ocaml
let rec max_tree n =
  if n = 0 then A else let t = max_tree (n - 1) in B (t, t, t)
```

### 4.

It can be shown for every $n \geq 1$ by induction that every minimal ternary AB-tree of depth $n$ is of the form $B(A, A, t)$, $B(A, t, A)$ or $B(t, A, A)$ where $t$ is a minimal ternary AB-tree of depth $n - 1$.
We can therefore declare the required function as follows:
$$
  \begin{gathered}
    \mathit{min\_tree} : \mathbb{N} \to \mathit{tree} \,, \\
    \begin{aligned}
      \mathit{min\_tree} \enspace 0
      &\coloneqq
      A
      \\
      \mathit{min\_tree} \enspace (n + 1)
      &\coloneqq
      B (A, A, \mathit{min\_tree} \enspace n)
    \end{aligned}
  \end{gathered}
$$
In OCaml code:
```ocaml
let rec min_tree n =
  if n = 0 then A else B (A, A, min_tree (n - 1))
```

### 5.

If $s_n$ denotes the size of the maximal ternary AB-tree of depth $n$, then we have the recurrence relation
$$
  s_0 = 1 \,,
  \quad
  s_{n + 1} = 3 s_n + 1 \,.
$$
The explicit formula for $s_n$ is $s_n = (3^{n + 1} - 1) / 2$.

### 6.

If $s_n$ denotes the size of a minimal ternary AB-tree of depth $n$, then we have the recurrence relation
$$
  s_0 = 1 \,,
  \quad
  s_{n + 1} = s_n + 3 \,.
$$
The explicit formula for $s_n$ is $s_n = 1 + 3 n$.
