# Exercise 4.12.3 (Sorting into descending order)

> Declare a function $\mathit{sort\_desc} : \forall \alpha. \; \mathcal{L}(\alpha) \to \mathcal{L}(\alpha)$ that reorders a list such that the elements appear in descending order.
> For instance, we want $\mathit{sort\_desc} \enspace [5, 3, 2, 5, 2, 3] = [5, 5, 3, 3, 2, 2]$.

---

We can first sort the list in ascending order and then reverse the result:
$$
  \mathit{sort\_desc} : \forall \alpha. \; \mathcal{L}(\alpha) \to \mathcal{L}(\alpha) \,, \\
  \mathit{sort\_desc} \enspace l \coloneqq \mathit{rev} \enspace (\mathit{isort} \enspace l) \,.
$$
In OCaml code:
```ocaml
let sort_desc l =
  List.rev (isort l)
```
