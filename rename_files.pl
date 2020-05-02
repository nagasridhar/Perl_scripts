#!/usr/bin/perl
use File::Basename;
use File::Copy qw(move);
use strict;
use warnings;
my @filename;
my $n=0;
my @kraken_name;
my @arac_name;
my %kraken_arac;
my $txt=".txt";
my $filename_fasta = $ARGV[0];
my $dir = "/Users/nagab/Desktop/Wellcome_data_output/mpa_files_sorted_cram/";
my $absolute_path="/Users/nagab/Desktop/Wellcome_data_output/mpa_files_sorted_cram/";
opendir(DIR, $dir) or die $!;

while (my $file = readdir(DIR)) {
              # Use a regular expression to ignore files beginning with a period
        next if ($file =~ m/^\./);
      	#print "$file\n";
        push @filename, $file;
          }
closedir(DIR);

# foreach(@filename){
#
#   print "$_\n";
# }


open (FILE,$filename_fasta) or die "No input file provided or the input file does not exist in the path, '$filename_fasta' $!";
while (my $file = <FILE>){
chomp $file;
if ($file) {							#Reading in the file and storing in different array for the header and sequence
$n++;
my @temp=split("\t",$file);
push(@kraken_name,$temp[0]);
push(@arac_name,$temp[1]);
							}
}
my $kraken_length=scalar(@kraken_name);
my $arac_length=scalar(@arac_name);
#print "kraken length: $kraken_length\n";
#print "Arac length: $arac_length\n";




keys %kraken_arac = @kraken_name;
 for(my $x=0; $x<@arac_name;$x++){
 $kraken_arac{$kraken_name[$x]} = $arac_name[$x];
  				}

          # foreach (sort keys %kraken_arac) {
          # 			    print "$_\n";
          # 					print "$kraken_arac{$_}\n";
          # 			  }


for(my$j=0;$j<@kraken_name;$j++){
foreach(@kraken_name){
          if($_ =~ m/($filename[$j])/){
            print "$_\n";
            my $original_file= join ('',$absolute_path,$_);
            print "$original_file\n";
            my $rename_file= join('',$absolute_path,$kraken_arac{$_});
          print "$kraken_arac{$_}\n";
          print "$rename_file\n";
          rename $original_file, $rename_file;
          					}
          				}
                }
