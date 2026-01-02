#include <stdio.h>
int main(int argc, char **argv){
  int i, ret,debug=0;
  unsigned int salary,nchar, total;
  char* infile, line[10], code;
  FILE *ifp;
  if(argc<2){
    fprintf(stderr,"usage:%s <input file>\n",argv[0]);
    return 1;
  }
  infile=argv[1];
  ifp=fopen(infile, "r");
    i=0;
    total=0;
	while(fgets(line, 10,ifp)!=0){
		ret = sscanf(line, "%1c %7d", &code, &salary);
		if (debug) printf("ret: %d %d code: %c salary: %d\n",ret,i,code,salary);	
		i++;
		total+=salary;
	  }
  printf("read %d records\n", i);
  printf("total: %d $\n", total);
  fclose(ifp);
  return 0;	
}
