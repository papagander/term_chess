module Pos = Chess_engine.Position
module Piece = Chess_engine.Piece

module PositionMap = Map.Make(struct
  type t = Chess_engine.Position.pos
  let compare = compare
end)

type board = Piece.piece PositionMap.t

let empty_board() : board = PositionMap.empty

let add_piece (b: board) (pos: Pos.position) (p: PT.piece) : board =
    PositionMap.add pos p b

  let remove_piece (b: board) (pos: Pos.position) : board =
    PositionMap.remove pos b

  let get_piece (b: board) (pos: Pos.position) : PT.piece option =
    PositionMap.find_opt pos b

  let move_piece (b: board) (from_pos: Pos.position) (to_pos: Pos.position) : board =
    match get_piece b from_pos with
    | None -> b
    | Some piece ->
        let b = remove_piece b from_pos in
        add_piece b to_pos piece

