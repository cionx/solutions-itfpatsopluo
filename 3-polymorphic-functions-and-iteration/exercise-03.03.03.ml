let rec fib' n a b =
  if n = 0 then a else fib' (n - 1) b (a + b)
