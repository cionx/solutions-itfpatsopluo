# Exercise 4.10.2 (Prefixes, Segments, Suffixes)

> Given a list $l = l_1 \mathbin{@} l_2 \mathbin{@} l_3$, we call $l_1$ a prefix, $l_2$ a segment, and $l_3$ a suffix of $l$.
> The definition is such that prefixes are segments starting at the beginning of a list, and suffixes are segments ending at the end of a list.
> Moreover, every list is a prefix, segment, and suffix of itself.  
> a) Convince yourself that segments are sublists.  
> b) Give a list and a sublist that is not a segment of the list.  
> c) Declare a function that yields a list containing all prefixes of a list.  
> d) Declare a function that yields a list containing all suffixes of a list.  
> e) Declare a function that yields a list containing all segments of a list.

---

### a)

I have convinced myself.

### b)

We can consider the list $[1, 2, 3]$ and sublist $[1, 3]$.
(This is the minimal counterexample.)

### c)

The only prefix of the empty list is the empty list.
Every prefix of a nonempty list $x :: l$ is either
- empty, or
- of the form $x :: l'$ for a prefix $l'$ of $l$.

We thus arrive at the following declaration:
$$
  \begin{gathered}
    \mathit{prefixes} : \forall \alpha. \; \mathcal{L}(\alpha) \to \mathcal{L}(\mathcal{L}(\alpha)) \,, \\
    \begin{aligned}
      \mathit{prefixes} \enspace [\,]
      &\coloneqq
      [[\,]] \,, \\
      \mathit{prefixes} \enspace (x :: l)
      &\coloneqq
      [\,] :: \mathit{map} \enspace (\lambda p. x :: p) \enspace (\mathit{prefixes} \enspace l) \,.
    \end{aligned}
  \end{gathered}
$$
In OCaml code:
```ocaml
let rec prefixes l =
  match l with
  | [] -> [[]]
  | x :: l -> [] :: List.map (fun p -> x :: p) (prefixes l)
```

### d)

The only suffix of the empty list is the empty list itself.
The suffixes of a nonempty list $x :: l$ are
- the entire list, and
- the suffixes of $l$.

We thus arrive at the following declaration:
$$
  \begin{gathered}
    \mathit{suffixes} : \forall \alpha. \; \mathcal{L}(\alpha) \to \mathcal{L}(\mathcal{L}(\alpha)) \,, \\
    \begin{aligned}
      \mathit{suffixes} \enspace [\,]
      &\coloneqq
      [[\,]] \,, \\
      \mathit{suffixes} \enspace (x :: l)
      &\coloneqq
      (x :: l) :: \mathit{suffixes} \enspace l \,.
    \end{aligned}
  \end{gathered}
$$
In OCaml code:
```ocaml
let rec suffixes l =
  match l with
  | [] -> [[]]
  | x :: l' -> l :: suffixes l'
```

### e)

The only segment of the empty list is the empty list itself.
The segments of a non-empty list $x :: l$ are precisely
- the segments of $l$, and
- the nonempty prefixes of $x :: l$, i.e., those prefixes of the form $x :: l'$ for a prefix $l'$ of $l$.

Based on these observations we declare the desired function as follows:
$$
  \begin{gathered}
    \mathit{segments} : \forall \alpha. \; \mathcal{L}(\alpha) \to \mathcal{L}(\mathcal{L}(\alpha)) \,, \\
    \begin{aligned}
      \mathit{segments} \enspace [\,]
      &\coloneqq
      [[\,]] \,, \\
      \mathit{segments} \enspace (x :: l)
      &\coloneqq
      \mathit{map} \enspace (\lambda l'. x :: l') \enspace (\mathit{prefixes} \enspace l)
      \enspace\mathbin{@}\enspace
      \mathit{segments} \enspace l \,.
    \end{aligned}
  \end{gathered}
$$
In OCaml code:
```ocaml
let rec segments l =
  match l with
  | [] -> [[]]
  | x :: l -> List.map (fun l' -> x :: l') (prefixes l) @ segments l
```
