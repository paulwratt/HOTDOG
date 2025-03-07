#!/usr/bin/perl

$date = `date "+%Y-%m-%d %H:%M"`;
chomp $date;

$base = "$ENV{'HOME'}/Screen Shot $date";
$path = "$base.png";
for ($i=0;;$i++) {
    if (-e $path) {
        $path = "$base-$i.png";
        next;
    }
    last;
}

system(qq{import -window root "$path"});
if ($? != 0) {
    system('hotdog', 'alert', 'Unable to take screen shot');
    exit 0;
}

system('hotdog', 'alert', "Screen shot is located at '$path'");

