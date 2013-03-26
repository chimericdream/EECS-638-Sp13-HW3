build:
	@echo "################################################################################"
	@echo "## EECS 638, Spring 2013"
	@echo "## Bill Parrott"
	@echo "## Homework #3\n"

	@make -B clean
	@make -B parta
	@make -B partb
	@make -B partc
	@make -B partd

	@echo "\n## Homework #3 successfully built"
	@echo "################################################################################\n"

parta:
	@echo "Building Part A:"

	@opsr2 wmt.ops > /dev/null
	@echo "Compiling wmt.ops with opsr2..........................Complete\n"

	@opsr2 wrul.ops
	@echo "Compiling wrul.ops with opsr2.........................Complete\n"

	@opsr2 decl.ops
	@echo "Compiling decl.ops with opsr2.........................Complete\n"

	@opsr2 rules.ops
	@echo "Compiling rules.ops with opsr2........................Complete\n"

	@opsr2 parta.ops
	@echo "Compiling parta.ops with opsr2........................Complete\n"

	@cc -c wmt.s
	@echo "Compiling wmt.s to wmt.o with cc......................Complete\n"

	@cc -c wrul.s
	@echo "Compiling wrul.s to wrul.o with cc....................Complete\n"

	@cc -c decl.s
	@echo "Compiling decl.s to decl.o with cc....................Complete\n"

	@cc -c rules.s
	@echo "Compiling rules.s to rules.o with cc..................Complete\n"

	@cc -c parta.s
	@echo "Compiling parta.s to parta.o with cc..................Complete\n"

	@cp /apps/opsr2/lib/shell.o ./
	@cp /apps/opsr2/lib/shellcr.o ./
	@cp /apps/opsr2/lib/rwbnolnk.o ./
	@cp /apps/opsr2/lib/opslib.a ./
	@cp /apps/opsr2/lib/startup.o ./
	@echo "Copying required files from /apps/opsr2/lib...........Complete\n"

	@cc wmt.o wrul.o decl.o rules.o parta.o shell.o shellcr.o rwbnolnk.o opslib.a startup.o -lm -o parta
	@echo "Compiling part a output file..........................Complete\n"

partb:
	@echo "Building Part B:"

	@opsr2 partb.ops
	@echo "Compiling partb.ops with opsr2........................Complete\n"

	@cc -c partb.s
	@echo "Compiling partb.s to partb.o with cc..................Complete\n"

	@cc wmt.o wrul.o decl.o rules.o partb.o shell.o shellcr.o rwbnolnk.o opslib.a startup.o -lm -o partb
	@echo "Compiling part b output file..........................Complete\n"

partc:
	@echo "Building Part C:"

	@opsr2 partc.ops
	@echo "Compiling partc.ops with opsr2........................Complete\n"

	@cc -c partc.s
	@echo "Compiling partc.s to partc.o with cc..................Complete\n"

	@cc wmt.o wrul.o decl.o rules.o partc.o shell.o shellcr.o rwbnolnk.o opslib.a startup.o -lm -o partc
	@echo "Compiling part c output file..........................Complete\n"

partd:
	@echo "Building Part D:"

	@opsr2 partd.ops
	@echo "Compiling partd.ops with opsr2........................Complete\n"

	@cc -c partd.s
	@echo "Compiling partd.s to partd.o with cc..................Complete\n"

	@cc wmt.o wrul.o decl.o rules.o partd.o shell.o shellcr.o rwbnolnk.o opslib.a startup.o -lm -o partd
	@echo "Compiling part b output file..........................Complete\n"

clean:
	@rm -f parta partb partc partd wmt.o wrul.o decl.o rules.o parta.o partb.o partc.o partd.o
	@rm -f wmt.s wrul.s decl.s rules.s parta.s partb.s partc.s partd.s
	@rm -f wmt.syn wrul.syn decl.syn rules.syn parta.syn partb.syn partc.syn partd.syn
	@rm -f shell.o shellcr.o rwbnolnk.o opslib.a startup.o
	@echo "Cleaning files from previous makes....................Complete\n"
