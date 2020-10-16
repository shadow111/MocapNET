#!/bin/bash

FROMDATASET="$1"
X=0


if (( $# != 1 )); then
    echo "Please run giving the path to download and build"
    echo "$0 \"DatasetNameSource\" "
   exit 0
fi


TOTAL_FRAMES=100000

cd $FROMDATASET 
 
echo "Spliting Dataset $FROMDATASET "
echo "Please wait .. "
for (( i=$X; i<=$TOTAL_FRAMES; i++ ))
do    
  XNUM=`printf %05u $i` 
    
  if [ -f "colorFrame_0_$XNUM.jpg" ] 
    then
     #First crop second half ( before source file gets rewritten )
     convert colorFrame_0_$XNUM.jpg -crop 1280x720+1280+0 colorFrame_1_$XNUM.jpg
     convert colorFrame_0_$XNUM.jpg -crop 1280x720+0+0 colorFrame_0_$XNUM.jpg
    else
      break
    fi
 
  echo -n "."
done

echo "Passed TOTAL_FRAMES (!) this is a bug! :S"

cd ..

exit 0
