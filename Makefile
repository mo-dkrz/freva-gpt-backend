.PHONY: release

release:
	@echo "Bumping version..."
	@OLD=$$(grep '^version' Cargo.toml | cut -d'"' -f2); \
	NEW=$$(echo $$OLD | awk -F. '{$$NF=$$NF+1; print}' OFS=.); \
	sed -i "0,/version = /s/version = \"[^\"]*\"/version = \"$$NEW\"/" Cargo.toml; \
	git add Cargo.toml && git commit -m "chore: release $$NEW" && git tag "V$$NEW"; \
	echo "$$OLD → $$NEW | Run: git push --follow-tags"