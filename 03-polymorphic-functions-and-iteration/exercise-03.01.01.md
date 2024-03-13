# Exercise 3.1.1

> Declare functions admitting the following polymorphic types:
> 1. `∀ α. α → α`
> 2. `∀ α β. α → β → α`
> 3. `∀ α β γ. (α × β → γ) → α → β → γ`
> 4. `∀ α β γ. (α → β → γ) → α × β → γ`
> 5. `∀ α β. α → β`

---

### 1.

We can use the identity function:
```ocaml
let id x = x
```

### 2.

We can use projection onto the first argument:
```ocaml
let first x y = x
```

### 3.

We can combine the second and third argument into a tuple, which we then plug into the first argument:
```ocaml
let curry f x y = f (x, y)
```

### 4.

We can decompose the second argument into two values, which we then plug into the function that serves as the first argument:
```ocaml
let uncurry f (x, y) = f x y
```

### 5.

We cannot declare such a function:
we could instantiate `α` by a nonempty type and `β` by the empty type, and then no such function exists.

However, if we allow for recursive, divergent functions, then we can cheat a bit:
```ocaml
let rec loop x = loop x
```
