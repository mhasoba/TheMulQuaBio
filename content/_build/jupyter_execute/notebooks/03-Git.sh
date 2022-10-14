cd ~/Documents/CMEECourseWork

git init

echo "My CMEE Coursework Repository" > README.md

git config --list

ls -al

git add README.md

git status

git commit -m "Added README file."

git status

git add *.txt

git status

git commit -m "Full first commit of new project"

git status

echo -e "*~ \n*.tmp" > .gitignore

cat .gitignore

git add .gitignore

touch temporary.tmp

echo "Text in a file to remove" > FileToRem.txt

git add FileToRem.txt

git commit -am "added a new file that we'll remove later"

git rm FileToRem.txt

git commit -am "removed the file"
