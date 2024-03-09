# Exercise 5.2.6 (Minimal Trees)

> A tree is _minimal_ if its size is minimal for all trees of the same depth.
> The two minimal trees of depth 2 look as follows:
> ```text
>    B                      B
>   / \                    / \
>  /   \                  /   \
> A     B                B     A
>      / \              / \
>     /   \            /   \
>    A     A          A     A
> ```
> 1. Declare a function $\mathit{mtree} : \mathbb{N} \to \mathbb{tree}$ that yields a minimal tree of depth $n$.
>    Also give a tail-recursive function such that $\mathit{mtree}' \; n \; A$ yields a minimal tree of depth $n$.
> 2. Declare a function $\mathit{check} : \mathit{tree} \to \mathcal{O}(\mathbb{N})$ such that $\mathit{check} \; t = \mathsf{Some} \; n$ if $t$ is a minimal tree of depth $n$, and $\mathit{check} \; t = \mathsf{None}$ if $t$ is not minimal.

---



### 1.

The following trees are minimal:
```text
  B
 / \
A   B
   / \
  A   B
     / \
    A   .
         .
          .
           \
            B
           / \
          A   B
             / \
            A   A
```
We can thus reuse the function $\mathit{dtree}$ from Exercise 5.2.4, renaming it to $\mathit{mtree}$:
$$
  \begin{gathered}
    \mathit{mtree} : \mathbb{N} \to \mathit{tree} \,, \\
    \begin{aligned}
      \mathit{mtree} \; 0
      &\coloneqq
      A \,,
      \\
      \mathit{mtree} \; (n + 1)
      &\coloneqq
      B \; A \; (\mathit{mtree} \; n)
    \end{aligned}
  \end{gathered}
$$
In OCaml code:
```ocaml
let rec mtree n =
  if n = 0 then A else B (A, mtree (n - 1))
```

The function $\mathit{mtree}'$ can be declared as follows:
$$
  \begin{gathered}
    \mathit{mtree}' : \mathbb{N} \to \mathit{tree} \to \mathit{tree} \,, \\
    \begin{aligned}
      \mathit{mtree}' \; 0 \; t
      &\coloneqq
      t \,,
      \\
      \mathit{mtree}' \; (n + 1) \; t
      &\coloneqq
      \mathit{mtree}' \; n \; (B \; A \; t)
    \end{aligned}
  \end{gathered}
$$
In OCaml code:
```ocaml
let rec mtree' n t =
  if n = 0 then t else mtree' (n - 1) (B (A, t))
```



### 2.

We can check that $t$ is either $A$, or that one of the branches of $t$ is $A$ and the other branch is minimal.
We thus get the following declaration for $\mathit{check}$ in OCaml:
```ocaml
let rec check t =
  match t with
  | A -> Some 0
  | B (A, t) | B (t, A) -> begin
    match check t with
    | None -> None
    | Some n -> Some (n + 1)
    end
  | B (B _, B _) -> None
```
