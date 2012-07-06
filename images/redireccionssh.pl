#!/usr/bin/perl -w
use strict;
use GraphViz;

my $g = GraphViz->new();

$g->add_node('Aplicacion Cliente');
$g->add_node('Aplicación Servidor');
$g->add_node('Cliente SSH', );
$g->add_node('Servidor SSH',);

$g->add_edge('Cliente SSH' => 'Servidor SSH', label => " conexión redirigida");
$g->add_edge('Aplicacion Cliente' => 'Cliente SSH');
$g->add_edge('Servidor SSH' => 'Aplicación Servidor', );
$g->add_edge('Aplicacion Cliente' => 'Aplicación Servidor', label => "conexión directa ");

open my $f, ">", "images/sshredirect.eps";
print $f $g->as_ps;
close($f);
