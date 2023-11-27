
#Script that accept httpx results, extract the 403 and try to brute force it for results
URLS=$(cat $1 | grep 403 | cut -d " " -f 1)

for url in $URLS;do

	ffuf -u "${url}/FUZZ" -w "/home/lilbullet/wordlists/SecLists/Discovery/Web-Content/raft-large-directories.txt" -rate 150 -fc 403 | tee output.txt

done

