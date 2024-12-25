type piece_type = 
  | King
  | Queen
  | Rook
  | Bishop
  | Knight
  | Pawn

type color = 
  | White
  | Black

type piece_id = 
  | King_White
  | Queen_White
  | Rook_White
  | Bishop_White
  | Knight_White
  | Pawn_A_White
  | Pawn_B_White
  | Pawn_C_White
  | Pawn_D_White
  | Pawn_E_White
  | Pawn_F_White
  | Pawn_G_White
  | Pawn_H_White
  | King_Black
  | Queen_Black
  | Rook_Black
  | Bishop_Black
  | Knight_Black
  | Pawn_A_Black
  | Pawn_B_Black
  | Pawn_C_Black
  | Pawn_D_Black
  | Pawn_E_Black
  | Pawn_F_Black
  | Pawn_G_Black
  | Pawn_H_Black

type piece = {
  piece_type: piece_type;
  color: color;
}
