package Luhn;

use v5.38;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_luhn_valid>;
my $i=0;
my $digit=0;
my $sum=0;

sub is_luhn_valid ($number) {
    $number=~ s/^\s+|\s+$//g;
    $number=~ s/\s+//g;
    $number=reverse($number);
    if ($number=~ /\D+/ || length($number)==1){
        return 0;
    }
    else{
        $sum=0;
        for ($i=0;$i<length($number);$i=$i+1) {
            $digit = int(substr($number,$i,1));
            if ($i%2 != 0){
                $digit=2 * $digit;
                if ($digit > 9){
                    $digit=$digit - 9;
                }     
            }
            $sum=$sum + $digit;
        }
        return ($sum % 10 == 0);
    }
}
