let rec rev_con l1 l2 =
  match l1 with
  | [] -> l2
  | x :: l1 -> rev_con l1 (x :: l2)

let rev l =
  rev_con l []

let con l1 l2 =
  rev_con (rev l1) l2
