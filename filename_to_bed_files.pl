#!/usr/bin/perl
use strict;
use warnings;
my $filename_fasta = $ARGV[0];
my $group_names = $ARGV[1];
my $filename=$0;
my @header;
my @sequence;
my @M1_seq;
my @M2_seq;
my @M3_seq;
my @FMC_seq;
my $n=0;
my $m=0;
my @temp;
my @new_header;
my $carat=">";
my $uscore="_";
my @group;
my $extsn = ".txt";

open (FILE,$filename_fasta) or die "No input file provided or the input file does not exist in the path, '$filename_fasta' $!";
while (my $file = <FILE>){
chomp $file;
if ($file) {							#Reading in the file and storing in different array for the header and sequence
$n++;
#$file =~s/>//g;
$header[$n]=$file;
	}
							}

my $output_file = $filename_fasta.$extsn;
open(my $fh, '>', $output_file) or die "Could not open file '$output_file' $!";
foreach(@header){
	my @name=split(/_/,$filename_fasta);
	$name[2]=~ s/.fna.bed//g;
	#print $fh "$name[1]\n";
	print $fh "$name[3]$uscore$name[4]$uscore$name[5]$uscore$name[6]$uscore$name[7]\t$_\n";
	#print "$_\n";
}
