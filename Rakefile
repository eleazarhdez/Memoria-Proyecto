MAINNAME = 'perlexamples'
PERLBIB= "perlbib/perl.bib"
TEXFILES = %w{
  ejecuciondeprogramas.tex
}

desc "Construye #{MAINNAME}.pdf"
task :default => "#{MAINNAME}.pdf"

desc "Construye #{MAINNAME}.pdf"
task :pdf => "#{MAINNAME}.pdf"

desc "Construye #{MAINNAME}.pdf"
file 'perlexamples.pdf' => [ PERLBIB ] +  [ "#{MAINNAME}.tex"]  do
  sh <<'MAKE_PDF'
    latex perlexamples.tex
    bibtex perlexamples
    makeindex -c perlexamples.idx
    latex perlexamples.tex
    dvips perlexamples.dvi
    ps2pdf perlexamples.ps
MAKE_PDF
end

desc "Construye #{MAINNAME}.tex a partir del tt2"
file 'perlexamples.tex' => [ PERLBIB ] + TEXFILES + [ 'perlexamples.tt2' ] do
	sh 'perl booktt/commontex/tt2.pl'
end

task :clean do
  sh "rm -fR #{MAINNAME}/"
end


desc "Construye los ficheros *.html"
file 'perlexamples/index.html' => 'perlexamples.tex' do
   sh %q{latex2html -html_version 4.0,latin1,unicode -white -local_icons -scalable_fonts -style mystyle.css perlexamples}
   sh %q{latex2htmllabels perlexamples}
   sh %q{cp css/mystyle.css perlexamples/}
end

desc "Construye los ficheros *.html y copia #{MAINNAME}.pdf en perlexamples"
task :html => [ 'perlexamples/index.html', "#{MAINNAME}.pdf" ] do
  sh "cp #{MAINNAME}.pdf perlexamples/"
end

desc "copy images into perlexamples"
task :images do 
	sh 'cp images/* perlexamples/'
end

desc "Publica HTML en el servidor 'pp2' usando rsync"
task :publichtml => %w{html} do
	sh %q{cp perlexamples.pdf perlexamples/}
	sh %q{rsync -aue ssh  perlexamples/ pp2:public_html/perlexamples/}
	#chmod a+r ${HOME}/public_html/perlexamples/*
end

desc "Build a zip with everything"
task :zip do
  sh "zip -r pp2book.zip perlexamples/"
end

require 'rake/clean'
CLEANLIST = [ "#{MAINNAME}.pdf", "#{MAINNAME}.ps", 
              "#{MAINNAME}.toc", "#{MAINNAME}.log", 
              "#{MAINNAME}.dvi", "#{MAINNAME}.aux", "#{MAINNAME}.bbl", "#{MAINNAME}.blg", 
              "#{MAINNAME}.lot", "#{MAINNAME}.lof", "#{MAINNAME}.ind", "#{MAINNAME}.ilg", 
              "#{MAINNAME}.idx", "#{MAINNAME}.out", "#{MAINNAME}.tex", 
              
              "tmp"]
CLEAN.include(CLEANLIST)
