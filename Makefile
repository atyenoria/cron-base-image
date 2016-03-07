default:
	docker build -t atyenoria/consul-base . & docker run -it atyenoria/consul-base zsh
s:
	docker run -it --rm atyenoria/consul-base zsh
b:
	docker build -t atyenoria/consul-base .
r:
	 docker  run -it -d --name consul-base atyenoria/consul-base
d:
	docker rm -f consul-base
e:
	docker exec -it consul-base zsh
