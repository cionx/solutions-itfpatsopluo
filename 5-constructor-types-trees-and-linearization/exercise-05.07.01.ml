type nat = Zero | Succ of nat



let rec add m n =
  match m with
  | Zero -> n
  | Succ m -> Succ (add m n)

let rec mul m n =
  match m with
  | Zero -> Zero
  | Succ m -> add (mul m n) n

let rec pow m n =
  let one = Succ Zero in
  match n with
  | Zero -> one
  | Succ n -> mul (pow m n) m



let rec nat_to_int' n acc =
  match n with
  | Zero -> acc
  | Succ n -> nat_to_int' n (acc + 1)

let nat_to_int n =
  nat_to_int' n 0

let rec int_to_nat' i acc =
  if i = 0 then acc else int_to_nat' (i - 1) (Succ acc)

let int_to_nat i =
  int_to_nat' i Zero
