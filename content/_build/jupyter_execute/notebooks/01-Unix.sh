cd ~/Downloads

sudo dpkg -i <file>.deb # de-package it
sudo apt-get install -f  # install dependencies

cd ~/Documents

ls

mkdir CMEECourseWork && cd CMEECourseWork

mkdir Week1

cd Week1

mkdir sandbox

cd Sandbox

rm sandbox

mv sandbox Sandbox

cd Sandbox
pwd
ls
touch TestFile # OR, "touch TestFile.txt"
ls
mv TestFile TestFile2
rm TestFile2

mkdir -p Week1/{Data,Code,Sandbox}

ls -lt

echo "My first line." > test.txt
cat test.txt
echo "My second line" >> test.txt
ls / >> ListRootDir.txt
cat ListRootDir.txt #Isn't that cool?!

ls / | wc -l

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

wget https://raw.githubusercontent.com/mhasoba/TheMulQuaBio/master/data/spawannxs.txt #Cool!

head -n 50 spawannxs.txt #You will see "head" in R as well

mkdir ../Data

mv spawannxs.txt ../Data/
cd ../Data
head -n 50 spawannxs.txt 

grep Falco spawannxs.txt

grep -i Falco spawannxs.txt

grep -i ara spawannxs.txt

grep -i -w ara spawannxs.txt

grep -i -w -A 1 ara spawannxs.txt

grep -i -w -B 1 ara spawannxs.txt

grep -i -w -n ara spawannxs.txt

grep -i -w -v ara spawannxs.txt

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

find . -name "File1.txt"

find . -iname "fi*.txt"

find . -maxdepth 2 -name "*.txt"

find . -maxdepth 2 -not -name "*.txt"

find . -type d -iname *dir*
