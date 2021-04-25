base=23
for ((i=0;i<8;i++)); 
do 
	cat $1 | sed 1,1d | csvtool col 1,$((base+2*i))-$((base+2*i+1)) -
done
