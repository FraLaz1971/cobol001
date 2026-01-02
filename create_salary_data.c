#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
int get_record(char *record);

int main(int argc, char **argv){
  int i,nrec,res;
  unsigned int salary;
  char* outfile, record[10], code[2];
  FILE *ofp;
  if(argc<3){
    fprintf(stderr,"usage:%s <output_file> <n_records>\n",argv[0]);
    return 1;
  }
  outfile=argv[1];
  nrec=atoi(argv[2]);
  ofp=fopen(outfile, "w");
    srand(time(NULL));
    i=0;
	while(i<nrec){
		res = get_record(record);
		fprintf(ofp,"%7s\n",record);		
		i++;
	  }
  fclose(ofp);
  return 0;	
}

int get_record(char *record){
	 char *code[1];
	 unsigned int salary,nchar;
	 salary=(unsigned int)((rand()/(float)RAND_MAX)*1000000.0);
	 /* ASCII 49,50,65,66 */
	 code[0]=(char)((rand()/(float)RAND_MAX)*5.0);
	 switch((int)code[0]){
		 case(0):
			code[0]=(char)49;
		 break;
		 case(1):
			code[0]=(char)50;
		 break;
		 case(2):
			code[0]=(char)51;
		 break;
		 case(3):
			code[0]=(char)65;
		 break;
		 case(4):
			code[0]=(char)66;
		 break;
		 default:
		    fprintf(stderr,"get_record(): unexpected code value\n");
	 }
	 nchar = snprintf(record, 10, "%1s %6u",code,salary);
	 if (nchar<0){
		 fprintf(stderr,"snprintf(): encoding error\n");
		 return -1;
	 }
	 return record;
}
