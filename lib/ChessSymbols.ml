(* ChessSymbols.ml *)
let square_size = 4

(* Enum for chess pieces and square colors *)
type piece =
  | WhiteKing
  | BlackKing
  | WhiteQueen
  | BlackQueen
  | WhiteRook
  | BlackRook
  | WhiteBishop
  | BlackBishop
  | WhiteKnight
  | BlackKnight
  | WhitePawn
  | BlackPawn
  | WhiteSquare
  | BlackSquare

(* Module for loading and providing chess symbols *)
module ChessSymbols : sig
  val load_symbols : unit
  val get_symbol : piece -> string
  val draw_black_square : unit -> unit
  val draw_white_square : unit -> unit
end = struct
  (* Internal table to store key -> symbol mappings *)
  let symbol_table = Hashtbl.create 16

  let filename = "/Users/timdolin/chess_pieces.txt"

  (* Map piece enums to file keys *)
  let piece_to_key = function
    | WhiteKing -> "white_king"
    | BlackKing -> "black_king"
    | WhiteQueen -> "white_queen"
    | BlackQueen -> "black_queen"
    | WhiteRook -> "white_rook"
    | BlackRook -> "black_rook"
    | WhiteBishop -> "white_bishop"
    | BlackBishop -> "black_bishop"
    | WhiteKnight -> "white_knight"
    | BlackKnight -> "black_knight"
    | WhitePawn -> "white_pawn"
    | BlackPawn -> "black_pawn"
    | WhiteSquare -> "white_square"
    | BlackSquare -> "black_square"

  (* Load symbols from a file into the hash table *)
  let load_symbols =
    let ic = open_in filename in
    let rec read_lines () =
      try
        let line = input_line ic in
        match String.split_on_char ' ' line with
        | [key; symbol] -> Hashtbl.replace symbol_table key symbol; read_lines ()
        | _ -> read_lines () (* Skip invalid lines *)
      with End_of_file -> close_in ic
    in
    read_lines ()

  (* Retrieve the symbol for a given piece *)
  let get_symbol piece =
    let key = piece_to_key piece in
    try Hashtbl.find symbol_table key
    with Not_found -> failwith ("Symbol not found for: " ^ key)

  let draw_black_square () = Printf.printf "%-*s" 4 (get_symbol BlackSquare)
  let draw_white_square () = Printf.printf "%-*s" 4 (get_symbol WhiteSquare)

end
