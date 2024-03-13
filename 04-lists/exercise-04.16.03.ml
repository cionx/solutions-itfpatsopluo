(** From the textbook. *)

let rec lookup m a =
  match m with
  | [] -> None
  | (a', b) :: l ->
    if a' = a then Some b else lookup l a



(** For this exercise. *)

let rec bound m a =
  match m with
  | [] -> false
  | (a', _) :: m -> a = a' || bound m a

let bound m a =
  match lookup m a with
  | None -> false
  | Some _ -> true
