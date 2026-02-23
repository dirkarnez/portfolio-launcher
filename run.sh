./devtunnel.exe host -p 3000 --allow-anonymous --protocol auto | while IFS= read -r line; do 
	encoded=$(echo -n "$line" | grep -i -Po "https://[^\-\s]+\-[^\-\s]+.devtunnels.ms" | base64)
	if [ -n "$encoded" ]; then
		curl -L \
		-X PUT \
		-H "Accept: application/vnd.github+json" \
		-H "Authorization: Bearer " \
		-H "X-GitHub-Api-Version: 2022-11-28" \
		https://api.github.com/repos/dirkarnez/gittest/contents/12345 \
 		--data "{\"message\":\"my commit message\",\"committer\":{\"name\":\"Monalisa Octocat\",\"email\":\"octocat@github.com\"},\"content\":\"$encoded\"}"
	else
		echo "empty"
	fi
done




