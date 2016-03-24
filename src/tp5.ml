let bwt genome_file =
  let seq = Fasta.extract_first_seq (Fasta.of_file genome_file) in
  let bwt_string = Sequence.bwt_naive seq
  in print_endline bwt_string

let unbwt bwt_file =
  let input = open_in bwt_file in
  let bwt = input_line input
  in let string = Sequence.unbwt bwt
  in print_endline string
