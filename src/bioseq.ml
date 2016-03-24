let chrono f =
  let t1 = Unix.gettimeofday() in
  f ();
  let t2 = Unix.gettimeofday() in
  t2 -. t1
					 


		   
let main =
  let commande = Sys.argv.(1) in
  match commande with
  | "search-fasta-naive" ->
     let genome_file = Sys.argv.(2)
     and seq_file = Sys.argv.(3)
     in let time = chrono (fun () -> Tp4.search_fasta_naive genome_file seq_file)
	in Printf.printf "\n\nexecuté en %f secondes\n" time
  | "suffix-array-naive" ->
     let genome_file = Sys.argv.(2)
     in let time = chrono (fun () ->  Tp4.suffix_array genome_file)
	in Printf.printf "\n\nexecuté en %f secondes\n" time
  | "suffix-array" ->
     let genome_file = Sys.argv.(2)
     in let time = chrono (fun () ->  Tp6.suffix_array genome_file)
	in Printf.printf "\n\nexecuté en %f secondes\n" time
  | "suffix-array-10" ->
     let genome_file = Sys.argv.(2)
     in let time = chrono (fun () ->  Tp6.ten_suffix_array genome_file)
	in Printf.printf "\n\nexecuté en %f secondes\n" time
  | "search-fasta-sa" ->
     let genome_file = Sys.argv.(2)
     and read_seq =  Sys.argv.(3)
     in  let time = chrono (fun () ->  Tp4.search_fasta_sa genome_file read_seq)
	 in Printf.printf "temps total : %f secondes\n" time
  | "bwt-naive" ->
     let genome_file = Sys.argv.(2)
     in let time = chrono (fun () ->  Tp5.bwt genome_file)
	in Printf.printf "temps total : %f secondes\n" time
  | "bwt" ->
     let genome_file = Sys.argv.(2)
     in let time = chrono (fun () ->  Tp6.bwt genome_file)
	in Printf.printf "temps total : %f secondes\n" time
  | "bwt-10" ->
     let genome_file = Sys.argv.(2)
     in let time = chrono (fun () ->  Tp6.ten_bwt genome_file)
	in Printf.printf "temps total : %f secondes\n" time
  | "unbwt" ->
     let bwt_file = Sys.argv.(2)
     in let time = chrono (fun () ->  Tp5.unbwt bwt_file)
	 in Printf.printf "temps total : %f secondes\n" time  
  | "test" ->
     let string = Sys.argv.(2)
     in print_endline string
  | _ -> prerr_endline "commande inconue"
	       
