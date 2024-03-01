
# Exercise 2.4.1
> Translate the following concrete expressions into equivalent abstract expressions.
> Use graded projections.  
> a) $\text{let } (x, y) = z \text{ in } x + y$  
> b) $\lambda f x y . f x y$  
> c) $\text{let rec } f \; x \; y = \text{ if } x < 1 \text{ then } y \text{ else } f \; (x − 1) \; (y + 1) \text{ in } f \; 5 \; 6$

---

### a)

Not sure, maybe $π^2_1 z + π^2_2 z$.

### b)

An equivalent expression is $\lambda f. \lambda x. \lambda y. (f x) y$.

### c)

Not sure, maybe
$$
  \text{let rec } f \; x = \lambda y . \text{ if } x < 1 \text{ then } y \text{ else } f \; (x - 1) \; (y + 1) \text{ in } (f \; 5) \; 6 \,.
$$
