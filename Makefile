COB=cobc -x
RM=rm -rf
TARGETS=employee hello salary salary_data sumnum divide factorial create_expenses data_length read_expenses
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
divide: divide.cbl
	$(COB) $< -o $@
factorial: factorial.cbl
	$(COB) $< -o $@
create_expenses: create_expenses.cbl
	$(COB) $< -o $@
read_expenses: read_expenses.cbl
	$(COB) $< -o $@
data_length: data_length.cbl
	$(COB) $< -o $@

clean:
	$(RM) $(TARGETS)
