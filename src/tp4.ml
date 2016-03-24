let chrono f =
  let t1 = Unix.gettimeofday() in
  f ();
  let t2 = Unix.gettimeofday() in
  t2 -. t1

(* renvoi la liste des indices de début de la sous chaine [substring] présent dans la chaien [string]*)
let naive_substring_search substring string =
  let string_l = String.length string in
  let substring_l = String.length substring in
  let rec aux acc = function
    | i when i = string_l - (substring_l - 1) -> acc
    | i -> let acc2 =
	     if (String.sub string i substring_l) = substring
	     then i::acc
	     else acc
	   in aux acc2 (i+1)
  in List.rev (aux [] 0)

let search_fasta_naive genome_file string =
  (* extraction du de la sequence  *)
  let (_,seq) = Fasta.extract_first_seq (Fasta.of_file genome_file) in
  (* on extrait les positions de la sequences recherché sous forme de liste *)
  let i_list = naive_substring_search string seq in
  (* On l'affiche *)
  List.iter (fun x -> Printf.printf "%d " x) i_list

let suffix_array seq_file =
  let seq = Fasta.extract_first_seq (Fasta.of_file seq_file) in
  let i_array = Sequence.extract_suffix_array_naive seq in
  Array.iter (fun x -> Printf.printf "%d " x) i_array

let search_fasta_sa genome_file read_seq =
  let seq = Fasta.extract_first_seq (Fasta.of_file genome_file) in
  let suffix_array = Sequence.extract_suffix_array seq in
  let time = chrono (fun () ->
		     let l = Sequence.search_with_array read_seq seq suffix_array
		     in List.iter (fun x -> Printf.printf "%d " x) l)
  in Printf.printf "\n\ntemps de recherche : %f secondes\n" time

