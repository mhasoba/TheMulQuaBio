cd ~/Documents # same as /home/YourUserName/Documents

mkdir CMEECourseWork

cd CMEECourseWork

mkdir week1

cd week1

mkdir sandbox code data results

rm -r sandbox

mkdir sandbox

mv sandbox Sandbox

ls

mv Sandbox sandbox
ls

cd sandbox

ls # nothing here yet

touch TestFile # OR, "touch TestFile.txt"

ls

mv TestFile TestFile2; ls # commands can also be sequentially executed with a `;`

rm TestFile2

cd ../../ # cd two directory levels higher, assuming you are currently in CMEECourseWork/Week1/sandbox

ls -l

ls -R

ls -lR # same as ls -l -R

cd week1/sandbox

echo "My first line." > test.txt
cat test.txt

echo "My second line" >> test.txt
cat test.txt

ls -lt | head -5

mkdir TestWild
cd TestWild
touch File1.txt
touch File2.txt
touch File3.txt
touch File4.txt
touch File1.csv
touch File2.csv
touch File3.csv
touch File4.csv
touch Anotherfile.csv
touch Anotherfile.txt
ls 
ls | wc -l

ls *
ls File*
ls *.txt
ls File?.txt
ls File[1-2].txt
ls File[!3].*

cd ../ # move one level up from TestWild, back to sandbox
wget https://raw.githubusercontent.com/mhasoba/TheMulQuaBio/master/content/data/spawannxs.txt #Cool!

ls

mv spawannxs.txt ../data # Move the file to the appropriate location (note the ../ - relative path)

cd ../data # Move to the data directory

head -n 50 spawannxs.txt #You will see "head" in R and Python as well

grep Falco spawannxs.txt

grep -i Falco spawannxs.txt

grep -i ara spawannxs.txt

grep -i -w ara spawannxs.txt

grep -i -w -A 1 ara spawannxs.txt

grep -i -w -B 1 ara spawannxs.txt

grep -i -w -n ara spawannxs.txt

cd ../sandbox # again, note the relative path!

mkdir TestFind
cd TestFind
mkdir -p Dir1/Dir11/Dir111 #what does -p do?
mkdir Dir2
mkdir Dir3
touch Dir1/File1.txt
touch Dir1/File1.csv
touch Dir1/File1.tex
touch Dir2/File2.txt
touch Dir2/file2.csv
touch Dir2/File2.tex
touch Dir1/Dir11/Dir111/File111.txt
touch Dir3/File3.txt

ls

ls Dir1

ls Dir* # the asterisk wildcards names so you can find all dirs with a particular start to their name

find . -name "File1.txt"

find . -iname "fi*.txt"

find . -maxdepth 2 -name "*.txt"

find . -maxdepth 2 -not -name "*.txt"

find . -type d -iname *dir*
