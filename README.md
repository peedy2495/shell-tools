## Welcome to Shell Toolz

This is my favourite collection of functions.
They are organized in themes ("libraries").

just source needed lib in your Project/Workflow.

Content:
<br /><br />

### **toolz_misc.sh :**  


***CheckCmdReqirements [cmd1] [cmd2] ... [cmdn]***  
Check all reqired shell commands to perform sone previous actions;
<br /><br />

### **toolz_configs.sh :** 

***ReplVar [varname] [filepath]***  
replace variablename found in a file with it's content;

***PlaceBefore [matchstring] [content] [filepath]***  
Insert text into a file before found match;

***PlaceAfter [matchstring] [content] [filepath]***  
Insert text into a file after found match;

***KeyDisable [key] [filepath]***  
Disable (comment) all matched keys in file;

***KeyEnable [key] [filepath]***  
Enable (comment out) all matched keys in file;

***KeySet [key] [value] [filepath]***  
Set value of a key separated with '=' within a configfile;
<br /><br />

### **toolz_network.sh :** 

***WaitForHost [ip/hostname(default:localhost)] [port(default:80/http)] [protocol(default:tcp)] [prefixstring]***  
Waiting for destination host on port number;

***GetNetmask [CDIR-prefix]***  
Get GetNetmask from CDIR prefix;

***GetBroadcast [ip] [CDIR-prefix]***  
Get broadcast address of given IP and CDIR prefix;

***GetNetwork [ip] [CDIR-prefix]***  
Get network address of given IP and CDIR prefix;
<br /><br />

### **toolz_github.sh :** 

***CountReleases [repository]***  
Get total nuber of releses

***GetAllReleases [repository]***  
Get all release-versions

***CheckRelease [repository] [releaseversion]***  
Check, if a given release is available  
returncode: 0=existing 1=failed

***GetLatestVersion [repository]***  
Get latest version number

***GetFileDownloadURL [repository] [filename] [releasenumber] (optional)***  
Get downloadurl of a filerelease; without releasenumber = latest
