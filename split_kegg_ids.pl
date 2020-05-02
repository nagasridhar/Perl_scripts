#!/usr/bin/perl
use strict;
use warnings;
my $kegg_ids = $ARGV[0];
my @line;
my @line_1_13;
my @line_17_23;
my @line_27_30;
my @line_31_50;
my @line_52_57;
my @data;
my $n=0;
my $comma=",";
my $underscore="_";
my $text = ".txt";
my $EL="EL";
my $ind_file="_individual_elements";


open (FILE,$kegg_ids) or die "No input file provided or the input file does not exist in the path, '$kegg_ids' $!";
while (my $file = <FILE>){
chomp $file;
if ($file) {							#Reading in the file and storing in different array for the header and sequence

#$file =~s/>//g;
$line[$n]=$file;
$n++;
			}
												}


foreach(@line){
my @tmp = split("\t",$_);
for(my $x=1;$x<@tmp;$x++){
print "$tmp[0]\t$tmp[$x]\n";
}
}
