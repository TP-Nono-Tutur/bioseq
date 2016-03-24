let ten_suffix_array seq_file =
  let seq = Fasta.extract_first_seq (Fasta.of_file seq_file) in
  Printf.printf "séquence chargé\n";
  let i_array = Sequence.extract_suffix_array seq in
  Printf.printf "suffix array généré\n";
  for i = 0 to 9 do
    Printf.printf"%d " i_array.(i)
  done

let suffix_array seq_file =
  let seq = Fasta.extract_first_seq (Fasta.of_file seq_file) in
  let i_array = Sequence.extract_suffix_array seq in
  Array.iter (fun x -> Printf.printf "%d " x) i_array

let ten_bwt genome_file =
  let seq = Fasta.extract_first_seq (Fasta.of_file genome_file) in
  let bwt_string = Sequence.bwt seq
  in for i = 0 to 9 do
       Printf.printf"%c " bwt_string.[i]
     done

	     
let bwt genome_file =
  let seq = Fasta.extract_first_seq (Fasta.of_file genome_file) in
  let bwt_string = Sequence.bwt seq
  in print_endline bwt_string
