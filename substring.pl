use strict;
use warnings;
my $filename_fasta = $ARGV[0];
my $start = $ARGV[1];
my $end = $ARGV[2];
my @header;
my @sequence;
my $n=0;


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

$start = $start - 1000;
$end = $end + 1000;
my $string = substr $sequence[1], $start, ($end-$start);

print "$string \n";
#my $length = length($string);

#print "Length of substring $length \n";
