#!/usr/bin/perl
use strict;
use warnings;
my $dataset_file = $ARGV[0];
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


open (FILE,$dataset_file) or die "No input file provided or the input file does not exist in the path, '$dataset_file' $!";
while (my $file = <FILE>){
chomp $file;
if ($file) {							#Reading in the file and storing in different array for the header and sequence

#$file =~s/>//g;
$line[$n]=$file;
$n++;
			}
												}


my @filename=split(/\./,$dataset_file);
print "$filename[0]\n";
my $path="$filename[0]$ind_file";
mkdir $path;


for(my $x=0; $x<=12; $x++){
	push(@line_1_13, $line[$x]);
													}
my $line14=$line[13];
my $line15=$line[14];
my $line16=$line[15];

for(my $x=16; $x<=22; $x++){
	push(@line_17_23, $line[$x]);
													}
my $line24=$line[23];
my $line25=$line[24];
my $line26=$line[25];



for(my $x=26; $x<=29; $x++){
	push(@line_27_30, $line[$x]);
													}

for(my $x=30; $x<=49; $x++){
	push(@line_31_50, $line[$x]);
													}

my $line51=$line[50];

for(my $x=51; $x<=56; $x++){
	push(@line_52_57, $line[$x]);
													}

for(my $x=57; $x<@line; $x++){
push(@data, $line[$x]);
														}

my @line_count=split(",",$line26);
# This portion of the code prints multiple files

for (my $y=1;$y<@line_count;$y++){


my @tmp_line14=split(",",$line14);
my @tmp_line16=split(",",$line16);
my @tmp1=split(",",$line24);
my @tmp2=split(",",$line26);
my @tmp4=split(",",$line51);

my $tmp4_length=scalar(@tmp4);
#print "Length of color variable: $tmp4_length\n";


my $output_file = "$filename[0]$underscore$tmp2[$y]$text";
open(my $fh, '>', "$path/$output_file") or die "Could not open file '$output_file' $!";

foreach(@line_1_13){
	print $fh "$_\n";
							}
print $fh "$tmp_line14[0]$comma$tmp2[$y]\n";
print $fh "$line15\n";
print $fh "$tmp_line16[0]$comma$tmp4[$y]\n";
foreach(@line_17_23){
	print $fh "$_\n";
							}
print $fh "$tmp1[0]$comma$tmp1[$y]\n";
print $fh  "$line25\n";
print $fh "$tmp2[0]$comma$tmp2[$y]\n";
foreach(@line_27_30){
	print $fh "$_\n";
}
#print $fh "$tmp3[0]$comma$tmp3[$y]\n";
foreach(@line_31_50){
	print $fh "$_\n";
}
print $fh "$tmp4[0]$comma$tmp4[$y]\n";
foreach(@line_52_57){
	print $fh "$_\n";
}
foreach(@data){
my @tmp5=split(",",$_);
print $fh "$tmp5[0]$comma$tmp5[$y]\n";
}

						}
