default:
	docker build -t atyenoria/cron . & docker run -it atyenoria/cron zsh
s:
	docker run -it --rm atyenoria/cron zsh
b:
	docker build -t atyenoria/cron .
r:
	 docker  run -it -d --name cron atyenoria/cron
d:
	docker rm -f cron
e:
	docker exec -it cron zsh
