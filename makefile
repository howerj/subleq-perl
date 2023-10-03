.PHONY: run test clean
IMAGE=eforth.dec
BITS=16

run test: subleq.pl ${IMAGE}
	./subleq.pl ${BITS} ${IMAGE}

clean:

