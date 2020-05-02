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
my @new_header1;	
my $carat=">";
my %header_seq;	
open (FILE,$filename_fasta) or die "No input file provided or the input file does not exist in the path, '$filename_fasta' $!";
chomp $filename_fasta;
while (my $file = <FILE>){
chomp $file;
if ($file =~/^>/) {							#Reading in the file and storing in different array for the header and sequence
$n++;
$header[$n]=$file;
	}	else{
next if not @header;
$sequence[$n] .= $file;
			}
							}


# my $header_length = scalar(@sequence)	
#
# print "The length of header, $header_length\n"	
# for (my $i=0	 $i<@header	 $i++)
# {
# @temp = split(/\s/, $header[$i])	
# $new_header[$i]=$carat.$temp[1]	
# }

# foreach (my $i=0	 $i<@new_header	 $i++){
# 	print "$new_header[$i]\n"	
# 	print "$sequence[$i]\n"	
# }

open (FILE1,$group_names) or die "No input file provided or the input file does not exist in the path, '$group_names' $!";
while (my $file1 = <FILE1>){
if ($file1){
	chomp $file1;
	$new_header1[$m]=$carat.$file1;
$m++;	
	}
}

#my $header_length = scalar(@new_header)	

#print "The length of header, $header_length\n"	

# foreach (@new_header){
# 	print "$_\n"	
# }


# keys %header_seq = @new_header	
#  for(my $x=0	 $x<@new_header	$x++){
#  $header_seq{$new_header[$x]} = $sequence[$x]	
#   }

keys %header_seq = @header;	
 for(my $x=0; $x<@header;$x++){
 $header_seq{$header[$x]} = $sequence[$x];
  }


foreach(@new_header1){
	print "$_ \n $header_seq{$_}\n";
}
