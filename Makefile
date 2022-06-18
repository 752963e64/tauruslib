all: libs apps

libs:
	@echo '-> Building libs'
	@make --no-print-directory -C src
	@echo ''

apps:
	@echo '-> Building apps:'
	@make --no-print-directory -C src static
	@make --no-print-directory -C src shared
	@echo ''
	@echo '==========================================='
	@echo 'run_shared version:'
	@echo '	LD_LIBRARY_PATH=lib bin/donut_shared'
	@echo ''
	@echo 'run static version:'
	@echo '	bin/donut_static'

clean:
	@echo -n '-> Cleaning: '
	@make --no-print-directory -C src clean
	@echo ''
