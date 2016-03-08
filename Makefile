default:
	docker build -t atyenoria/cron-base . & docker run -it atyenoria/cron-base zsh
s:
	docker run -it --rm atyenoria/cron-base zsh
b:
	docker build -t atyenoria/cron-base .
r:
	 docker  run -it -d --name cron-base atyenoria/cron-base
d:
	docker rm -f cron-base
e:
	docker exec -it cron-base zsh
