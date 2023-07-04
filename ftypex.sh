#!/bin/bash

echo "
   ___ _                   
  |  _| |_ _ _ ___ ___ _ _ 
  |  _|  _| | | . | -_|_'_|
  |_| |_| |_  |  _|___|_,_|
          |___|_|          
"
echo "   | auto file extractor |"
echo "   |   santiagocardoso   |"
echo "   -=-=-=-=-=-=-=-=-=-=-=-"
echo ""

<<'////'
$ chmod +x ftypex.sh
$ ./fypex.sh file1.type file2.type ...
////

if [ $# -eq 0 ];
then
    echo "   $0: Missing arguments..."
    exit 1
fi

echo "   Number of arguments: $#"
echo "   -=-=-=-=-=-=-=-=-=-=-=-"
for i in "$@"
do
    echo "   Arg..... $i"
done
echo "   -=-=-=-=-=-=-=-=-=-=-=-"
echo ""

for i in "$@"
do
    type=$(echo "$i" | cut -d '.' -f2)

    case $type in
        zip)
            unzip $i
            ;;
        rar)
            unrar $i
            ;;
        tar)
            tar -xf $i
            ;;
        *)
            echo -n "   Invalid file type!"
            ;;
    esac
done

