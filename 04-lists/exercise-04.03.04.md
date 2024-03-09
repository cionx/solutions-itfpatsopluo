# Exercise 4.3.4 (Decimal Numbers)

> With lists we have a mathematical representation for decimal numbers.
> For instance, the decimal representation for the natural number $1234$ is the list $[1, 2, 3,4]$.  
> a) Declare a function $\mathit{dec} : \mathbb{N} \to \mathcal{L}(\mathbb{N})$ that yields the decimal number for a natural number.
>    For instance, we want $\mathit{dec} \; 1324 = [1, 3, 2, 4]$.  
> b) Declare a function $\mathit{num} : \mathcal{L}(\mathbb{N}) \to \mathbb{N}$ that converts decimal numbers into numbers:
>    $\mathit{num} \; (\mathit{dec} \; n) = n$.
>    Hint:
> Declare $\mathit{num}$ with a tail-recursive function $\mathit{num}'$ such that, for instance,
> $$
>   \begin{aligned}
>        \mathit{num} \; [1, 2, 3]
>     &= \mathit{num}' \; [1, 2, 3] \; 0 \\
>     &= \mathit{num}' \; [2, 3] \; 1 \\
>     &= \mathit{num}' \; [3] \; 12 \\
>     &= \mathit{num}' \; [] \; 123 \\
>     &= 123
>   \end{aligned}
> $$

---

### a)

We can declare the function $\mathit{dec}$ as follows:
```ocaml
let rec dec' n acc =
  if n = 0 then acc
  else dec' (n / 10) ((n mod 10) :: acc)

let dec n =
  dec' n []
```

### b)

We can declare the function $\mathit{num}$ as follows:
```ocaml
let rec num' digits acc =
  match digits with
  | [] -> acc
  | d :: ds -> num' ds (10 * acc + d)

let num digits =
  num' digits 0
```
