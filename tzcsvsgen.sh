#tzvsvgen 0.01 (c) SZERVÁC Attila, 2024, GNU GPLv3
areas=`grep -Ev "#" /usr/share/zoneinfo/zone.tab | cut -f 3 |
cut -d / -f 1 | sort | uniq`;
for a1 in $areas; do c=$((c+1)); areascsv=$areascsv$c","$a1"\n";
done; printf "$areascsv">areas.csv
while read a; do areas="$areas${a##*,} ";
done<areas.csv;
alo=`grep -Ev "#" /usr/share/zoneinfo/zone.tab | cut -f 3`;
for al in $alo; do pk=$((pk+1)); c=1;
are=${al%%/*}; loc=${al##*/};
 for a in $areas; do
  if test $a != $are; then c=$((c+1));
  else locsv=$locsv$pk,$loc,$c"\n"; break; fi;
 done; c=1;
done; printf "$locsv">tzlocs.csv
