formulae=$(subst ,,$(wildcard *.rb))

all :: update info

info ::
	for formula in $(formulae); do \
		brew info --json "./$$formula" | jq '.[0]? // .' > $${formula/%rb/json}; \
	done
