cowread
=======

Cowsay reads you books one login at a time.

<div>
<pre style='color:black;background:;'>
/ But besides the fact that cutting off  \
| Napoleon with his army would have been |
\ senseless, it was impossible.          /
 ----------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
</div>

Script makes a DAT file for fortune based on your input text.

Drops a line into ~/.bashrc to pipe random sentences to cowsay on login.

Use it like this:
	$ sudo apt-get install cowsay fortune-mod
	$ git clone https://github.com/albert-decatur/cowread.git
	$ sudo sh cowread/cowread.sh War+Peace.txt
