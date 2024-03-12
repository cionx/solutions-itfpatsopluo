module type BSTACK = sig
  val empty : unit -> bool
  val full : unit -> bool
  val push : int -> unit
  val pop : unit -> unit
  val top : unit -> int
  val height : unit -> int
end

module S : BSTACK = struct
  let size = 100
  let a = Array.make size 0
  let h = ref 0 (* height of stack *)
  exception Empty
  exception Full
  let empty () = !h = 0
  let full () = !h = size
  let push x = if full () then raise Full else a.(!h) <- x; h := !h + 1
  let pop () = if empty () then raise Empty else h := !h - 1
  let top () = if empty () then raise Empty else a.(!h - 1)
  let height () = !h
end
