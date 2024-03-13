# Correctness 16P

> Consider two iteration functions `∀ α. (α → α) → N → α → α` defined as follows:
> ```text
>       it f 0 x := x                     it' f 0 x := x
> it f (n + 1) x := it f n (f x)    it' f (n + 1) x := f (it' f n x)
> ```
> Prove that the two iteration functions agree, that is, `it f n x = it' f n x`.
> Hint:
> You will need a lemma for the proof.
> State and prove the lemma.

---

### The lemma

We will use the following shift lemma for `it`:

> **Lemma.**
> We have for all `f`, `n`, `x` the equality `f (it f n x) = it f n (f x)`.

We prove the lemma by induction over `n`.

Base case:
```text
  f (it f 0 x)
= f x             definition of it
= it f 0 (f x)    definition of it
```
Induction step:
```text
  f (it f (n + 1) x)
= f (it f n (f x))    definition of it
= it f n (f (f x))    induction hypothesis
= it f (n + 1) (f x)  definition of it
```

### The main statement

We can now prove the extensional equality of `it` and `it'` by induction over `n`.

Base case:
```text
  it f 0 x
= x           definition of it
= it' f 0 x   definition of it'
```
Induction step:
```
  it f (n + 1) x
= it f n (f x)      definition of it
= f (it f n x)      shift lemma for it
= f (it' f n x)     induction hypothesis
= it' f (n + 1) x   definition of it'
```

