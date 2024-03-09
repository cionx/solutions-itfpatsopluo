# Exercise 4.1.1

> Give the types of the following lists and tuples.  
> a) $[1, 2, 3]$  
> b) $(1, 2, 3)$  
> c) $[(1, 2), (2, 3)]$  
> d) $((1, 2), (2, 3))$  
> e) $[[1, 2], [2, 3]]$

---

We have the following types:

|    | expression         | type                                                                   |
|:---|:-------------------|:-----------------------------------------------------------------------|
| a) | $[1, 2, 3]$        | $\mathcal{L}(\mathbb{Z})$                                              |
| b) | $(1, 2, 3)$        | $\mathbb{Z} \times \mathbb{Z} \times \mathbb{Z}$                       |
| c) | $[(1, 2), (2, 3)]$ | $\mathcal{L}(\mathbb{Z} \times \mathbb{Z})$                            |
| d) | $((1, 2), (2, 3))$ | $(\mathbb{Z} \times \mathbb{Z}) \times (\mathbb{Z} \times \mathbb{Z})$ |
| e) | $[[1, 2], [2, 3]]$ | $\mathcal{L}(\mathcal{L}(\mathbb{Z}))$                                 |
