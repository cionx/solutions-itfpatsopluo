type 'a cell = 'a array
let alloc x = [| x |]
let get c = c.(0)
let set c x = c.(0) <- x
