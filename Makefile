EXE=bioseq.native

all:
	ocamlbuild -lib unix -I src -I deps/bio-info_ultimate/src -I deps/Module_perso ${EXE}

get_deps:
	git clone https://github.com/altor/Module_perso.git deps/Module_perso
	git clone https://github.com/TP-Nono-Tutur/bio-info_ultimate.git deps/bio-info_ultimate

doc:
	ocamldoc -d Doc -html -charset utf8 deps/Module_perso/array_mp.mli deps/Module_perso/fonction.mli deps/Module_perso/list_mp.mli deps/Module_perso/string_mp.mli deps/Module_perso/matrix.mli deps/Module_perso/math.mli # deps/bio-info_ultimate/src/fasta.mli deps/bio-info_ultimate/src/k_mer.mli deps/bio-info_ultimate/src/window.mli
clean:
	rm -Rf deps/*
	rm -R _build ${EXE}
