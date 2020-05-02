#!/usr/bin/perl
use strict;
use warnings;
my $filename_bed = $ARGV[0];

my @header;
my $n=0;
my $txt = ".txt";
my $contig = "Contig";
my $left = "Left";
my $right = "Right";
my $gene = "Gene";

open (FILE,$filename_bed) or die "No input file provided or the input file does not exist in the path, '$filename_bed' $!";

while (my $file = <FILE>){
chomp $file;							#Reading in the file and storing in different array for the header and sequence
$header[$n]=$file;
$n++;
	}

my @filename_txt=split(/\./,$filename_bed);
print "$filename_txt[0]\n";

my $output_file = $filename_txt[0].$txt;
open(my $fh, '>', $output_file) or die "Could not open file '$output_file' $!";

print $fh $left."\t".$right."\t".$gene."\n";

for(my $i=0; $i<@header; $i++){
my @tmp = split("\t",$header[$i]);
my $new = $tmp[1]."\t".$tmp[2]."\t".$tmp[3];
print $fh  "$new\n";
}
close $fh;
