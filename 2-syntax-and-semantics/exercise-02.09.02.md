# Exercise 2.9.2 (Tuple patterns)

> The translation rule for tuple patterns in Figure 2.5 is just given for pairs so that the translation fits into one line.
> Give the translation rule for triples.
> Try to give the translation rule for general patterns using the dots notation $(\cdots)$.

---

We have the following translation rule for triples:
$$
  \begin{aligned}
    &\text{let } (x, y, z) = e_1 \text{ in } e_2 \\
    &\rightsquigarrow\text{let } a = e_1 \text{ in let } x = \pi_1 \; a \text{ in let } y = \pi_2 \; a \text{ in let } z = \pi_3 \; a \text{ in } e_2
  \end{aligned}
$$

For general tuples we have the following translation rule:
$$
  \begin{aligned}
    &\text{let } (x_1, \dotsc, x_n) = e_1 \text{ in } e_2 \\
    &\rightsquigarrow\text{let } a = e_1 \text{ in let } x_1 = \pi_1 \; a \text{ in let } \dotsc\  x_n = \pi_n \; a \text{ in } e_2
  \end{aligned}
$$
