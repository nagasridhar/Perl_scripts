#!/usr/bin/perl
#use strict;
use warnings;
my $filename_bed = $ARGV[0];

my @header;
my $n=0;
my $append = "_colv.txt";
open (FILE,$filename_bed) or die "No input file provided or the input file does not exist in the path, '$filename_bed' $!";

while (my $file = <FILE>){
chomp $file;							#Reading in the file and storing in different array for the header and sequence
$header[$n]=$file;
$n++;
	}

my @filename_txt=split(/\./,$filename_bed);
print "$filename_txt[0]\n";

my $output_file = $filename_txt[0].$append;
open(my $fh, '>', $output_file) or die "Could not open file '$output_file' $!";

print "$filename_bed \n";

for(my $i=0; $i<@header; $i++){

#print "$header[$i]\n";

if($header[$i] =~m/(cvaA|cvaB|cvaC)/i){
 print $fh "$header[$i] \n";
	#print $fh "cva \t Yes \n";
}

if($header[$i]=~m/(iroB|iroC|iroD|iroE|iroN)/i){
	print $fh "$header[$i] \n";
	#print $fh "iro \t Yes \n";
}

if($header[$i]=~m/(iucA|iuaB|iuaC|iuaD)/i){
print $fh "$header[$i] \n";
	#print $fh "iuc \t Yes \n";
}


if($header[$i]=~m/(etsA|etsB|etsC)/i){
print $fh "$header[$i] \n";
	#print $fh "ets \t Yes \n";
}

if($header[$i]=~m/ompT/i){
print $fh "$header[$i] \n";
	#print $fh "ompT \t Yes \n";
}
if($header[$i]=~m/(sitA|sitB|sitC|sitD)/i){
print $fh "$header[$i] \n";
	#print $fh "sit \t Yes \n";
}
}
close $fh;
