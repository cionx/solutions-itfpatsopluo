let rec flatten lsts =
  match lsts with
  | [] -> []
  | l :: ls -> l @ flatten ls
