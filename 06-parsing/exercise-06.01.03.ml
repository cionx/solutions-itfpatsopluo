(** From the textbook. *)

let explode s = List.init (String.length s) (String.get s)
let implode l = List.fold_right (fun c s -> String.make 1 c ^ s) l ""
