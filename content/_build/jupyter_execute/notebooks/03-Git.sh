sudo apt-get install git
git config --global user.name "Your Name"
git config --global user.email "your.login@imperial.ac.uk"
git config --list

cd CMEECourseWork

git init

echo "My CMEE Coursework Repository" > README.txt

git config --list

ls -al

git add README.txt #Staging for commit

git status

git commit -m "Added README file." #you can use -am too

git status #what does it say now?

git add -A

git status

git remote add origin git@github.com:mhasoba/CMEECourseWork.git

git remote -v

git push origin master

echo -e "*~ \n*.tmp" > .gitignore

cat .gitignore

git add .gitignore

touch temporary.tmp

git add *

git add -A

git status
find . -size +100M | cat >> .gitignore  
echo "Text in a file to remove" > FileToRem.txt

git add FileToRem.txt

git commit -am "added a new file that we'll remove later"

git rm FileToRem.txt

git commit -am "removed the file"

git log

git reset --hard
git commit -am "returned to previous state" #Note I used -am here

git status

git log

git checkout 95f7d0

git checkout master

git branch anexperiment

git branch

git checkout anexperiment 

git branch

echo "Do I like this better?" >> README.txt

git commit -am "Testing experimental branch"

git checkout master

git merge anexperiment

cat README.txt 

git branch -d anexperiment

git branch -D anexperiment

find . -mindepth 1 -maxdepth 1 -type d -print -exec git -C {} pull \;
