RACOEXEFLAGS=--collects-path $(shell readlink -m $$(which racket)/../../share/racket/collects) --exf-clear ++exf -m ++exf -U ++exf --

TARGETS=mceval analyzingmceval leval ambeval

.PHONY : all
all : $(TARGETS)

.PHONY : clean
clean :
	rm -rf compiled $(TARGETS)

% : %.rkt
	raco exe $(RACOEXEFLAGS) -o $@ $<
