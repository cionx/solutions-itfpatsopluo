let rec has_value f x l r =
  l <= r
  &&
  let m = (l + r) / 2 in
  let y = f m in
  if x < y then has_value f x l (m - 1)
  else if x > y then has_value f x (m + 1) r
  else true

let square x =
  has_value (fun n -> n * n) x 0 x



let sqrt x =
  let rec helper l r =
    if l = r then l
    else begin
      let m = (l + r + 1) / 2 in (* rounded up *)
      let y = m * m in
      if x < y then helper l (m - 1)
      else helper m r
    end
  in
  helper 0 x



let inv f x =
  let rec helper l r =
    if l = r then l
    else begin
      let m = (l + r + 1) / 2 in (* rounded up *)
      let y = f m in
      if x < y then helper l (m - 1)
      else helper m r
    end
  in
  helper 0 x
