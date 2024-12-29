type pos = { file : int; rank : int }
type position = Invalid | Some of pos

let try_create file rank =
  if file < 1 || file > 8 || rank < 1 || rank > 8 then Invalid
  else Some { file; rank }

let create file rank =
  if file >= 1 && file <= 8 && rank >= 1 && rank <= 8 then
    { file; rank }
  else
    invalid_arg "Position out of bounds"

let is_invalid position =
  match position with
  | Invalid -> true
  | Some _ -> false

let validate position =
  match position with
  | Invalid -> invalid_arg "Invalid position"
  | Some pos -> pos

let shift position (dfile, drank) =
  if is_invalid position then Invalid
  else  
    let pos = validate position in
    let new_file = pos.file + dfile in
    let new_rank = pos.rank + drank in
    try_create new_file new_rank

let file_letter file_num =
  match file_num with
  | 1 -> 'A'
  | 2 -> 'B'
  | 3 -> 'C'
  | 4 -> 'D'
  | 5 -> 'E'
  | 6 -> 'F'
  | 7 -> 'G'
  | 8 -> 'H'
  | _ -> '_'

let name pos = Printf.sprintf "%c%d" (file_letter pos.file) pos.rank
