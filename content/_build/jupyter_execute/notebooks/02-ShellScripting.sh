bash myscript.sh # OR sh myscript.sh

chmod +x myscript.sh
myscript.sh

mkdir ~/bin
PATH=$PATH:$HOME/bin #Tell UNIX to look in /home/bin for commands

bash boilerplate.sh

echo "Remove    excess      spaces." | tr -s "\b" " "

echo "remove all the as" | tr -d "a"

echo "set to uppercase" | tr [:lower:] [:upper:]

echo "10.00 only numbers 1.33" | tr -d [:alpha:] | tr -s " " ","

echo -e "test \t\t test" >> ../SandBox/test.txt
bash tabtocsv.sh ../SandBox/test.txt
