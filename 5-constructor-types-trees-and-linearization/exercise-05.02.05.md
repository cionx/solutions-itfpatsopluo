# Exercise 5.2.5 (Maximal Trees)

> A tree is _maximal_ if its size is maximal for all trees of the same depth.
> The unique maximal tree of depth 2 looks as follows:
> ```text
>       B
>      / \
>     /   \
>    /     \
>   B       B
>  / \     / \
> A   A   A   A
> ```
> 1. Convince yourself that the two subtrees of a maximal tree are maximal and identical.
> 2. Declare a function $\mathit{mtree} : \mathbb{N} \to \mathit{tree}$ that yields the unique maximal tree of depth $n$.
>    Use a let expression to avoid binary recursion.
>    Also give a tail-recursive function such that $\mathit{mtree}' \; n \; A$ yields the maximal tree of depth $n$.
> 3. Give a non-maximal tree $t$ such that $\mathit{mirror} \enspace t = t$.
> 4. Declare a function $\mathit{check} : \mathit{tree} \to \mathcal{O}(\mathbb{N})$ such that $\mathit{check} \; t = \mathsf{Some} \; n$ if $t$ is a maximal tree of depth $n$, and $\mathit{check} \; t = \mathsf{None}$ if $t$ is not maximal.

---



### 1.

We show the following three propositions by induction:
1. The maximal tree of depth $n \geq 0$ is unique.
2. If $n \geq 1$ then the maximal tree of depth $n$ is of the form $B \; t \; t$ where $t$ is the maximal tree of depth $n - 1$.
3. The unique maximal tree of depth $n$ has size $2^{n + 1} - 1$.

The only tree of depth zero is $A$, which entails the first point for $n = 0$.
It also has size $1 = 2^{0 + 1} - 1$, which shows the third point for $n = 0$.

Suppose now that $n \geq 1$ and let $t$ be a maximal tree of depth $n$.
The tree $t$ is in particular not of depth zero, and thus of the form $B \; t_1 \; t_2$ for some trees $t_1$ and $t_2$, of depths $d_1$ and $d_2$ respectively. We have
$$
  n = 1 + \max \; d_1 \; d_2
$$
and thus $d_1, d_2 < n$.

Let $t'_1$ and $t'_2$ be the maximal tree of depth $n - 1$ and let $t' ≔ B \; t'_1 \; t'_2$.
The tree $t'$ is again of depth $n$ whence $\mathit{size} \; t \geq \mathit{size} \; t'$ by the maximality of $t$.
But we also have have
$$
  \mathit{size} \; t_i
  \leq
  2^{d_i + 1} - 1
  \leq
  2^{(n - 1) + 1} - 1
  =
  \mathit{size} \; t'_i
$$
by induction hypothesis (third point for $d_i$ and for $n - 1$), therefore
$$
  \mathit{size} \; t
  =
  1 + \mathit{size} \; t_1 + \mathit{size} \; t_2
  \leq
  1 + \mathit{size} \; t'_1 + \mathit{size} \; t'_2
  =
  \mathit{size} \; t' \,.
$$
It follows that actually $\mathit{size} \; t = \mathit{size} \; t'$.
This entails that the inequality $1 + \mathit{size} \; t_1 + \mathit{size} \; t_2 \leq 1 + \mathit{size} \; t'_1 + \mathit{size} \; t'_2$ is actually an equality, whence the two inequalities $\mathit{size} \; t_i \leq \mathit{size} \; t'_i$ are actually equalities.

We have thus found that $\mathit{size} \; t_i = \mathit{size} \; t'_i$ and therefore
$$
  \mathit{size} \; t_i
  =
  \mathit{size} \; t'_i
  =
  2^{(n - 1) + 1} - 1
$$
by induction hypothesis (third point for $n - 1$).
But if $d_i < n - 1$ for some $i$ then we would have
$$
  \mathit{size} \; t_i \leq 2^{d_i + 1} - 1 < 2^{(n - 1) + 1} - 1
$$
by induction hypothesis (third point for $d_i$).
We thus must have $d_i = n - 1$ for both $i$.

We have thus shown that both $t_1$ and $t_2$ are of depth $n - 1$ and of size $2^{(n - 1) + 1} - 1$.
By induction hypothesis (third point for $n - 1$), this means that both $t_1$ and $t_2$ are maximal of depth $n - 1$.
This shows the second point for $n$.
Together with the first point for $n - 1$ this further shows the first point for $n$.

Finally, we find that
$$
  \mathit{size} \; t
  = 1 + \mathit{size} \; t_1 + \mathit{size} \; t_2
  = 1 + 2^{(n - 1) + 1} - 1 + 2^{(n - 1) + 1} - 1
  = 2 \cdot 2^n - 1
  = 2^{n + 1} - 1 \,.
$$
This shows the third point for $n$.



### 2.

We can declare the function $\mathit{mtree}$ as follows:
$$
  \begin{gathered}
    \mathit{mtree} : \mathbb{N} \to \mathit{tree} \,, \\
    \begin{aligned}
      \mathit{mtree} \; 0 &\coloneqq A \,, \\
      \mathit{mtree} \; (n + 1) &\coloneqq B \; (\mathit{mtree} \; n) \; (\mathit{mtree} \; n) \,.
    \end{aligned}
  \end{gathered}
$$
In OCaml code:
```ocaml
let rec mtree n =
  if n = 0 then A
  else
    let m' = mtree (n - 1) in
    B (m', m')
```

We can declare the function $\mathit{mtree}'$ as follows:
$$
  \begin{gathered}
    \mathit{mtree}' : \mathbb{N} \to \mathit{tree} \to \mathit{tree} \,, \\
    \begin{aligned}
      \mathit{mtree}' \; 0 \; t &\coloneqq t \,, \\
      \mathit{mtree}' \; (n + 1) \; t &\coloneqq \mathit{mtree}' \; n \; (B \; t \; t) \,.
    \end{aligned}
  \end{gathered}
$$
In OCaml code:
```ocaml
let rec mtree' n t =
  if n = 0 then t else mtree' (n - 1) (B (t, t))
```



### 3.

We can consider the following tree:
```
           B
          / \
         /   \
        /     \
       /       \
      B         B
     / \       / \
    /   \     /   \
   B     A   A     B
  / \             / \
 /   \           /   \
A     A         A     A
```
(This is a minimal counterexample.)



### 4.

We check if $t$ is either $A$ or of the form $B \; t_1 \; t_2$ where $t_1$ and $t_2$ are maximal trees of the same height.
We can thus declare the function $\mathit{check}$ as follows in OCaml:
```ocaml
let rec check t =
  match t with
  | A -> Some 0
  | B (t1, t2) ->
    match check t1, check t2 with
    | None, _ | _, None -> None
    | Some n, Some m ->
      if n = m then Some (n + 1) else None
```
