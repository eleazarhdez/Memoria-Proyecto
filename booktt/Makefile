TEXTFILES=simplec.tex analisislexico.tex parseeyapp.tex perlbib/perl.bib construcciondeanalizadoreslexicos.tex introcomp.tex attributegrammars.tex treetransformations.tex simplectypes.tex 

perlexamples.ps : perlexamples.tex commands.tex simplec.tex prefacio.tex analisislexico.tex parseeyapp.tex perlbib/perl.bib erratas.tex construcciondeanalizadoreslexicos.tex introcomp.tex attributegrammars.tex treetransformations.tex simplectypes.tex 
	latex perlexamples.tex
	bibtex perlexamples
	makeindex -c perlexamples.idx
	latex perlexamples.tex
	dvips -o perlexamples.ps perlexamples.dvi

recdescent.ps : recdescent.tex 
	latex recdescent.tex
	dvips -o recdescent.ps recdescent.dvi

perlslides.ps : perlslides.tex 
	latex perlslides.tex
	dvips -t landscape -o perlslides.ps perlslides.dvi

clean:
	rm -fR perlexamples.ps *.toc *.log *.dvi *.aux *.aux *.bbl *.blg perlexamples/ *.idx *.ilg *.ind *.lof *.lot *.out *.pdf *.ps.gz tmp TMP *.ptr *.dia~ .*.swp .*.swo .#* .*.swl  .*.swn .*.swm

	-rm -fR TMP/l*

htmlimages: perlexamples.ps
	latex2html -white -no_reuse -local_icons -scalable_fonts perlexamples
	latex2htmllabels perlexamples 

html: perlexamples.ps
	# -no_reuse
	#latex2html -white -no_reuse -local_icons -scalable_fonts perlexamples
	latex2html -white -local_icons -scalable_fonts perlexamples
	latex2htmllabels perlexamples 

labs:  /home/pl/src/perl/uploadlab/Education-Labs/scripts/findlabs.pl $(TEXTFILES)
	/home/pl/src/perl/uploadlab/Education-Labs/scripts/findlabs.pl $(TEXFILES)  labs

#referencemanual: /home/pl/src/perl/YappWithDefaultAction/lib/Parse/Eyapp.pod
#	pod2latex /home/pl/src/perl/YappWithDefaultAction/lib/Parse/Eyapp.pod
#	latin2utf8.pl Eyapp.tex 
#  #iconv -f ISO_8859-15 -t UTF-8 Eyapp.tex > Eyapp.tex.utf8; cp Eyapp.tex.utf8 Eyapp.tex
#	#pod2latex /home/pl/src/perl/YappWithDefaultAction/lib/Parse/eyapptut.pm

installpublichtml:
	mkdir ${HOME}/public_html/perlexamples
	cp images/* ${HOME}/public_html/perlexamples/
	chmod -R a+r ${HOME}/public_html/perlexamples


publichtml: ISO_8859-15
	cp perlexamples.ps perlexamples/pl.ps
	cp perlexamples/* /home/pl/public_html/perlexamples/
	cp perlexamples.idx /home/pl/public_html/perlexamples/
	chmod a+r /home/pl/public_html/perlexamples/*

ISO_8859-15: 
	cp perlexamples/* perlexamples.latin/
	cd perlexamples.latin/; utf82latin.pl *.html

search:
	/home/pl/bin/html2textapuntes &

orion:
	rsync -aue ssh /home/pl/public_html/ casiano@orion:/home/casiano/public_html/pl/
	rsync -aue ssh /home/pl/doc/ casiano@orion:/home/casiano/pl/doc/

beowulf:
	rsync -aue ssh /home/pl/public_html/ casiano@beowulf:/home/casiano/public_html/pl/
	rsync -aue ssh /home/pl/doc/casiano/PLBOOK/PLBOOK/ casiano@beowulf:/home/casiano/pl/doc/PLBOOK/PLBOOK/

175:
	rsync -aue ssh /home/pl/public_html/ 193.145.105.175:/home/pl/public_html/
	rsync -aue ssh /home/pl/doc/casiano/PLBOOK/PLBOOK/ 193.145.105.175:/home/pl/doc/casiano/PLBOOK/PLBOOK/


etsii:
	#cd /home/pl/public_html/perlexamples; sftp casiano@etsii
	#syncwithetsii
	rsync -aue ssh /home/pl/public_html/perlexamples/ etsii:/home/casiano/doc/pl/html/perlexamples/

all: perlexamples.ps html publichtml search labs
superall: europa etsii
	#cvs commit -m"--"
