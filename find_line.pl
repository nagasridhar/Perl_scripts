#!/usr/bin/perl
use strict;
use warnings;
my $filename_fasta1 = $ARGV[0];
my $filename_fasta2 = $ARGV[1];
my @header;
my @sequence;
my @match;
my $n=0;
my $m=0;

open (FILE,$filename_fasta1) or die "No input file provided or the input file does not exist in the path, '$filename_fasta1' $!";
while (my $file = <FILE>){
if ($file =~/^\d+/) {							#Reading in the file and storing in different array for the header and sequence
$n++;
#$file =~s/>//g;
$header[$n]=$file;
	}	else{
next if not @header;
$sequence[$n] .= $file;
			}
							}

foreach (@header){print "$_ \n";}

open (FILE1,$filename_fasta2) or die "No input file provided or the input file does not exist in the path, '$filename_fasta2' $!";
while (my $file1 = <FILE1>){
	if($file1){
$match[$m]=$file1;
}
$m++;

}

foreach (@match){print "$_ \n";}
