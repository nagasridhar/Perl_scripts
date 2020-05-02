#!/usr/bin/perl
use strict;
use warnings;
my $filename_fasta = $ARGV[0];
my $n=0;
my $USC="_";

open (FILE,$filename_fasta) or die "No input file provided or the input file does not exist in the path, '$filename_fasta' $!";
while (my $file = <FILE>){
chomp $file;
if ($file) {							#Reading in the file and storing in different array for the header and sequence
$n++;
my @temp=split(/\|/,$file);
my $print_line= $temp[0];
my $scalar = scalar(@temp);
print "$temp[-1]\n";
#my @code = split(/\|/,$id);


# foreach(@temp){
#
# 	print "$_\t";
# }
# print "\n";
#$header[$n]=$file;
#	}	else{
#next if not @header;
#$sequence[$n] .= $file;
		}
							}
