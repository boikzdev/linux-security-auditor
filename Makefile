install:

	pip install -r requirements.txt



audit:

	bash scripts/audit.sh --all



report:

	python3 python/report_generator.py \
	--audit-results audit_results.json



test:

	pytest tests/



docker:

	docker build -t linux-security-auditor .
