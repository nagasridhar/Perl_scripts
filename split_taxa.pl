#!/usr/bin/perl
use strict;
use warnings;
my $taxa = $ARGV[0];
my @header;
my $n=0;



open (FILE,$taxa) or die "No input file provided or the input file does not exist in the path, '$taxa' $!";
while (my $file = <FILE>){
chomp $file;
if ($file) {							#Reading in the file and storing in different array for the header and sequence
$n++;
#$file =~s/>//g;
$header[$n]=$file;
	}
							}


foreach(@header){
$_ =~ tr/|/\t/;
print "$_\n";
}
