let move array i =
  let v = array.(i) in
  for j = i downto 1 do
    array.(j) <- array.(j - 1)
  done;
  array.(0) <- v


let mtf alphabet s =
  let f i car =
    let j = Array_mp.index_of alphabet car
    in move alphabet j;
       char_of_int (j + 48)
  in String.mapi f s

let unmtf alphabet s =
  let f i car =
    let j = (int_of_char car) - 48 
    in let car2 = alphabet.(j) in
       move alphabet j;
       car2
  in String.mapi f s



