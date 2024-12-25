open ChessSymbols
(*open Position*)

module Renderer = struct
  let draw_board (label_axes: bool): unit =
    let rec print_files (file_num: int): unit =
      if file_num == 9 then ()
      else begin
        Printf.printf "%-*d"  4 file_num;
        print_files (file_num + 1)
      end
    in if label_axes
      then print_files 1;
    print_endline "\n";
    let rec draw_row(row_num: int) : unit =
      if row_num = 0 then ()
      else begin
        if (row_num mod 2 = 0) then
          ChessSymbols.draw_white_square();
        ChessSymbols.draw_black_square();
        ChessSymbols.draw_white_square();
        ChessSymbols.draw_black_square();
        ChessSymbols.draw_white_square();
        ChessSymbols.draw_black_square();
        ChessSymbols.draw_white_square();
        ChessSymbols.draw_black_square();
        if (row_num mod 2 = 1) then 
          ChessSymbols.draw_white_square();
        print_endline "";
        draw_row (row_num - 1)
      end
    in
  draw_row 8

  (* Test draw by invoking draw_board *)
  let test_draw: unit = ChessSymbols.load_symbols; draw_board true
end
