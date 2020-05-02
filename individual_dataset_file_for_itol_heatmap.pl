#!/usr/bin/perl
use strict;
use warnings;
my $dataset_file = $ARGV[0];
my @line;
my @line_1_11;
my @line_13_15;
my @line_17_71;
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


for(my $x=0; $x<=10; $x++){
	push(@line_1_11, $line[$x]);
													}

my $line12=$line[11];

my $line16=$line[15];

for(my $x=12; $x<=14; $x++){
	push(@line_13_15, $line[$x]);
													}



for(my $x=16; $x<=70; $x++){
	push(@line_17_71, $line[$x]);
													}

for(my $x=71; $x<@line; $x++){
push(@data, $line[$x]);
														}



my @line_count=split(",",$line16);
#This portion of the code prints multiple files

for (my $y=1; $y<@line_count; $y++){

my @tmp_line12=split(",",$line12);
my @tmp_line16=split(",",$line16);

my $output_file = "$filename[0]$underscore$tmp_line16[$y]$text";
open(my $fh, '>', "$path/$output_file") or die "Could not open file '$output_file' $!";
# my $tmp_line12_count=scalar(@tmp_line12);
# print "$tmp_line12_count\n";
#
# my $tmp_line16_count=scalar(@tmp_line16);
# print "$tmp_line16_count\n";
# my @tmp1=split(",",$line24);
# my @tmp2=split(",",$line26);
# my @tmp3=split(",",$line31);
# my @tmp4=split(",",$line51);

foreach(@line_1_11){
	print $fh "$_\n";
							}
print $fh "$tmp_line12[0]$comma$tmp_line16[$y]\n";
print "$tmp_line12[0]$comma$tmp_line16[$y]\n";

foreach(@line_13_15){
	print $fh "$_\n";
							}

print $fh "$tmp_line16[0]$comma$tmp_line16[$y]\n";
print "$tmp_line16[0]$comma$tmp_line16[$y]\n";
foreach(@line_17_71){
	print $fh "$_\n";
							}

foreach(@data){
my @tmp5=split(",",$_);
print $fh "$tmp5[0]$comma$tmp5[$y]\n";

# my $tmp_data=scalar(@tmp5);
# print "$tmp_data\n";
}
						}
