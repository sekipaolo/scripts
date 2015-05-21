DISABLE_AUTO_TITLE="true"
function title ()
{
	export DISABLE_AUTO_TITLE=true  
	export TERM=vt100
  echo -ne "\e]1;$1\a"
	export TERM=xterm-256color
}
