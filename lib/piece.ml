open Piece_type

type piece_state =
  | Unmoved
  | Moved
  | Double_Moved

type piece_color = 
  | White
  | Black

type t = {
  piece_type_name : string; (* e.g., "King", "Pawn" *)
  state : piece_state;
  color : piece_color; (* White or Black *)
}
