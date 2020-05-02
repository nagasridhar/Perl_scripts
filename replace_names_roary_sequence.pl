#!/usr/bin/perl
#use strict;
#use warnings;
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
my $roary_header;
my @replace_array;
my $replace_header;
my $carat=">";
my $underscore="_";
my %header_seq;
my %roary_seq;
open (FILE,$filename_fasta) or die "No input file provided or the input file does not exist in the path, '$filename_fasta' $!";
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

keys %header_seq = @header;
for(my $x=0; $x<@header;$x++){
 $header_seq{$header[$x]} = $sequence[$x];
				}

# foreach (sort keys %header_seq) {
# 			    print "$_\n";
# 					print "$header_seq{$_}\n";
# 			  }


open (FILE1,$group_names) or die "No input file provided or the input file does not exist in the path, '$group_names' $!";
while (my $file1 = <FILE1>){
if ($file1){
	chomp $file1;
if ($file1 =~ m/"/) {$file1=~ s/"//g;}
$new_header[$m]=$file1;
$m++;
	}
}


for(my $i=0;$i<@new_header;$i++){
@temp=split("\t",$new_header[$i]);
my $scalar=scalar(@temp);
if($scalar>2){
	for(my $y=1;$y<@temp;$y++){
		$roary_header=$carat.$temp[1];
		#print "roary header: $roary_header\n";
		#print "Temp y value: $temp[$y]\n";
		$replace_header=$carat.$temp[0].$underscore.$temp[$y];
		#print "replace_header: $replace_header\n";
		push @new_header1, $roary_header;
		push @replace_array,$replace_header;
															}
														}
else {$roary_header=$carat.$temp[1];
$replace_header=$carat.$temp[0].$underscore.$temp[1];
#print "In else loop roary header: $roary_header\n";
#print "In else loop replace_header: $replace_header\n";
push @new_header1, $roary_header;
push @replace_array,$replace_header;
			}
}




keys %roary_seq = @new_header1;
 for(my $x=0; $x<@new_header1;$x++){
 $roary_seq{$new_header1[$x]} = $replace_array[$x];
  				}

					# foreach (sort keys %roary_seq) {
					# 			    print "$_\n";
					# 					print "$roary_seq{$_}\n";
					# 			  }




for(my$j=0;$j<@new_header1;$j++){
foreach(@header){
if($_ =~ m/($new_header1[$j])/){
#print "Match\n";
print "$roary_seq{$new_header1[$j]}\n";
print "$header_seq{$_}\n";
					}
				}
			}




# foreach(@new_header1){
# 		print "$_ \n";
# 	}


# for (my $k=0;$k<@header;$k++){
# 	foreach(@new_header1){
# 		if($_ =~ m/^($header[$k])$/){
# 			print "$header_seq{$_}\n";
# 			print "$sequence[$k]\n";
# 											}
# 												}
# 								}



# my $header_length1 = scalar(@new_header1);
# print "The length of header, $header_length1\n";


# for(my $j=0;$j<@header;$j++){
#
# foreach(@new_header1){
# 	if ( m/$header[$j]/ ) {
# 			 print "$_\n";
# 			 print "$sequence[$j]\n";
# 	 }
# }
#
# }




# foreach (@new_header1){
# 	print "$_\n";
# }


# keys %header_seq = @new_header;
#  for(my $x=0; $x<@new_header;$x++){
#  $header_seq{$new_header[$x]} = $sequence[$x];
#   }




# foreach(@new_header1){
# 	print "$_ \n $header_seq{$_}\n";
# }
