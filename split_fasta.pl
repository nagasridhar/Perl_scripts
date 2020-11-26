##### This code helps split a FASTA file into smaller sizes, in its current format splits a FASTA file into 4 separate files ####


use strict;
use warnings;
my $filename_fasta = $ARGV[0]; ### Reading in the input file
my @header;                    ### Array for saving the headers
my @sequence;                  ### Array for saving the respective sequence files
my $n=0;
my $split;
my $increment=0;
my $output_file;
my $initial=0;
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
			}
							}


my $header_count = scalar(@header);                      #### Counting the number of headers in the file
#print "No. of headers = $header\n";

if ($header%2 ==0 ){                                     ### Creating an if loop to make the split value as an even number
    $split = ($header/4);
        }

    else{
        my $header_count_inc = $header+1;
        $split = ($header_count/4);
    }    

    $increment = $split;                               ### Defining an increment variable for storing the split size

while($increment<=@header)){                           ### While loop for splitting the fasta file into 4 separate files
$output_file = "output.$increment.fa";                 
open(my $fh, '>', $output_file) or die "Could not open file '$output_file' $!";
for ($initial=$initial; $initial<=$increment;$initial++){
    print $fh "$header[$initial]\n";
    print $fh "$sequence[$initial]\n";
}
$initial=$increment;
$increment = $increment+$split;
print "New value of split: $increment\n";
}