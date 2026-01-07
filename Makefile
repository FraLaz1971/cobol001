COB=cobc -x
RM=rm -rf
TARGETS=employee hello salary salary_data sumnum divide factorial create_expenses data_length read_expenses \
read_ascii_binary record001 record002 moves manip pay control branches branches001 branches002 branches003 \
mistakes perform exsc008 record recordf sequence update_master create_mast_amend finderr diffrecs readrecs \
create_ex001_data ex001 table001 yeartot create_yeartot_data readamounts sumamounts readpeople readmatrix \
histo
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
read_ascii_binary: read_ascii_binary.cbl
	$(COB) $< -o $@
record001: record001.cbl
	$(COB) $< -o $@
record002: record002.cbl
	$(COB) $< -o $@
moves: moves.cbl
	$(COB) $< -o $@
manip: manip.cbl
	$(COB) $< -o $@
pay: pay.cbl
	$(COB) $< -o $@
control: control.cbl
	$(COB) $< -o $@
branches: branches.cbl
	$(COB) $< -o $@
branches001: branches001.cbl
	$(COB) $< -o $@
branches002: branches002.cbl
	$(COB) $< -o $@
branches003: branches003.cbl
	$(COB) $< -o $@
mistakes: mistakes.cbl
	$(COB) $< -o $@
perform: perform.cbl
	$(COB) $< -o $@
exsc008: exsc008.cbl
	$(COB) $< -o $@
record: record.cbl
	$(COB) $< -o $@
recordf: recordf.cbl
	$(COB) $< -o $@
sequence: sequence.cbl
	$(COB) $< -o $@
update_master: update_master.cbl
	$(COB) $< -o $@
create_mast_amend: create_mast_amend.cbl
	$(COB) $< -o $@
finderr: finderr.cbl
	$(COB) $< -o $@
diffrecs: diffrecs.cbl
	$(COB) $< -o $@
readrecs: readrecs.cbl
	$(COB) $< -o $@
create_ex001_data: create_ex001_data.cbl
	$(COB) $< -o $@
ex001: ex001.cbl
	$(COB) $< -o $@
table001: table001.cbl
	$(COB) $< -o $@
create_yeartot_data: create_yeartot_data.cbl
	$(COB) $< -o $@
yeartot: yeartot.cbl
	$(COB) $< -o $@
readamounts: readamounts.cbl
	$(COB) $< -o $@
sumamounts: sumamounts.cbl
	$(COB) $< -o $@
readpeople: readpeople.cbl
	$(COB) $< -o $@
readmatrix: readmatrix.cbl
	$(COB) $< -o $@
histo: histo.cbl
	$(COB) $< -o $@

clean:
	$(RM) $(TARGETS)
