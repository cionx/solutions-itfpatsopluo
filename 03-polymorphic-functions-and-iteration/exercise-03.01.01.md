# Exercise 3.1.1

> Declare functions admitting the following polymorphic types:  
> a) $\forall α. α \to α$  
> b) $\forall α β. α \to β \to α$  
> c) $\forall α β γ. (α \times β \to γ) \to α \to β \to γ$  
> d) $\forall α β γ. (α \to β \to γ) \to α \times β \to γ$  
> e) $\forall α β. α \to β$

---

### a)

We can use the identity function:
```ocaml
# let id x = x;;
val id : 'a -> 'a = <fun>
```

### b)

We can use projection onto the first argument:
```ocaml
# let first x y = x;;
val first : 'a -> 'b -> 'a = <fun>
```

### c)

We can combine the second and third argument into a tuple, which we then plug into the first argument:
```ocaml
``# let curry f x y = f (x, y);;
val curry : ('a * 'b -> 'c) -> 'a -> 'b -> 'c = <fun>`
```

### d)

We can decompose the second argument into two values, which we then plug into the function that serves as the first argument:
```ocaml
# let uncurry f (x, y) = f x y;;
val uncurry : ('a -> 'b -> 'c) -> 'a * 'b -> 'c = <fun>
```

### e)

We cannot declare such a function:
we could instantiate $α$ by a nonempty type and $β$ by the empty type, and then no such function exists.

However, if we allow for recursive, divergent functions, then we can cheat a bit:
```ocaml
# let rec loop x = loop x;;
val loop : 'a -> 'b = <fun>
```
