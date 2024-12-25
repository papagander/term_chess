module Chess_Core = struct

  type position = {
    rank : int;
    file : int; 
  }

  type position_verify = 
    | Position of int * int
    | Invalid

  let file_num_to_char (fileNum: int): char =
    match fileNum with
    | 1 -> 'A'
    | 2 -> 'B'
    | 3 -> 'C'
    | 4 -> 'D'
    | 5 -> 'E'
    | 6 -> 'F'
    | 7 -> 'G'
    | 8 -> 'H'
    | _ -> ' '

  let get_name (position: position): string =
    Printf.sprintf "%c%d" (file_num_to_char position.file) position.rank

  let check_position_on_board (rank: int) (file: int): position_verify =
    if rank < 1 || rank > 8 || file < 1 || file > 8 then Invalid
    else Position (rank, file)

  let create_position rank file =
    let new_pos = check_position_on_board rank file in
    if not (new_pos == Invalid) then
      failwith (Printf.sprintf "Position %c%d outside board" (file_num_to_char file) rank)
    else
      { rank; file }

  let apply_vector (pos: position) (vector: position): position_verify = 
    let rank = pos.rank + vector.rank in
    let file = pos.file + vector.file in
    check_position_on_board rank file;;

(*  let GetValidMoves()*)

end
