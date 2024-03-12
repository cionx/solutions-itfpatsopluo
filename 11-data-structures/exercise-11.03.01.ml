module type STACK = sig
  type 'a stack
  exception Empty
  exception Full
  val make : int -> 'a -> 'a stack
  val push : 'a stack -> 'a -> unit
  val pop : 'a stack -> unit
  val top : 'a stack -> 'a
  val height : 'a stack -> int
end

module ArrayStack : STACK = struct
  type 'a stack = 'a array * int ref
  exception Empty
  exception Full

  let make h x : 'a stack =
    (Array.make h x, ref 0)

  let empty ((_, h) : 'a stack) =
    !h = 0

  let full ((a, h) : 'a stack) =
    !h = Array.length a

  let push ((a, h) : 'a stack) x =
    if full (a, h) then raise Full
    else a.(!h) <- x; h := !h + 1

  let pop ((a, h) : 'a stack) =
    if empty (a, h) then raise Empty
    else h := !h - 1

  let top ((a, h) : 'a stack) =
    if empty (a, h) then raise Empty
    else a.(!h - 1)

  let height ((_, h) : 'a stack) =
    !h
end
