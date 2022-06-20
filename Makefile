all: apps

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
	@echo ''
	@echo 'If you wish to use 32bit instead native'
	@echo 'run "make -C src shared32" and "make -C src static32"'


clean:
	@echo -n '-> Cleaning: '
	@make --no-print-directory -C src clean
	@echo ''
