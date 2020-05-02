#!/usr/bin/perl
use strict;
use warnings;
my $filename_fasta = $ARGV[0];
my $group_names = $ARGV[1];
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
my @group;

open (FILE,$filename_fasta) or die "No input file provided or the input file does not exist in the path, '$filename_fasta' $!";
while (my $file = <FILE>){
chomp $file;
if ($file =~/^>/) {							#Reading in the file and storing in different array for the header and sequence
$n++;
#$file =~s/>//g;
$header[$n]=$file;
	}	else{
next if not @header;
$sequence[$n] .= $file;
			}							}

foreach(@sequence){
	my $start = 0;
	my $end = 150;
	my $string = substr $_, 0, ($end-$start);
	my $len = length($string);
push(@M1_seq,$string);
}

for(my $i=0;$i<@M1_seq;$i++){

	print "$header[$i]\n";
	print "$M1_seq[$i]\n";
}
