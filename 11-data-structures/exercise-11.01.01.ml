(** From the textbook. *)

module type CELL = sig
  type 'a cell
  val make : 'a -> 'a cell
  val get : 'a cell -> 'a
  val set : 'a cell -> 'a -> unit
end



(** For this exercise. *)

module Cell : CELL = struct
  type 'a cell = 'a ref
  let make x = ref x
  let get c = !c
  let set c x = c := x
end
