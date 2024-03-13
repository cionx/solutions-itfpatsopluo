(** First solution *)

let rec splits' l1 l2 acc =
  match l2 with
  | [] -> (List.rev l1, []) :: acc
  | x :: l -> splits' (x :: l1) l ((List.rev l1, l2) :: acc)

let splits1 l =
  splits' [] l []



(** Second solution *)

let rec splits2 l =
  match l with
  | [] -> [([], [])]
  | x :: l ->
    let s = splits2 l in
    let s' = List.map (fun (l1, l2) -> (x :: l1, l2)) s in
    ([], x :: l) :: s'
