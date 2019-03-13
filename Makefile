COMPOSE ?= docker-compose -f ./wikibase-docker/docker-compose.yml -f docker-compose.override.yml
SERVICES ?=
COMMAND ?= bash
OPTS ?=

.PHONY: up
up:
	$(COMPOSE) up -d $(OPTS) $(SERVICES)

.PHONY: logs
logs:
	$(COMPOSE) logs --tail=1000 -f $(OPTS) $(SERVICES)

.PHONY: shell
shell:
	$(COMPOSE) exec $(OPTS) wikibase $(COMMAND)

.PHONY: ps down pull restart stop start config
ps down pull restart stop start config:
	$(COMPOSE) $@ $(OPTS) $(SERVICES)

# dump
# backup
# restore
