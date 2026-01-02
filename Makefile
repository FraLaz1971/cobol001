COB=cobc -x
RM=rm -rf
TARGETS=employee hello salary salary_data sumnum
.PHONY: all clean

all: $(TARGETS)


employee: employee.cbl
	$(COB) $< -o $@
hello: hello.cbl
	$(COB) $< -o $@
salary: salary.cbl
	$(COB) $< -o $@
salary_data: salary_data.cbl
	$(COB) $< -o $@
sumnum: sumnum.cbl
	$(COB) $< -o $@

clean:
	$(RM) $(TARGETS)
