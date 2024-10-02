#!/bin/bash
# Written By Ram Rohan Dantu ; UID : 2021201555 ;  FOR THE COURSE 
# SOFTWARE TESTING,VERIFICATION AND VALIDATION SE6367 By Prof. Weichen Erik Wong
# Teaching Assistant Ruizi Ricky Gao
# University of Texas at Dallas


ZERO=0
TESTCASE=1
echo "ALL OUTPUT "$'\n' > Dantu-Test.Output
echo "ALL ERRORS "$'\n' > Dantu-Test.Error

#T001
echo $'\n''TESTCASE NO:'$TESTCASE$'\n'  >> Dantu-Test.Output 
./spell docs/doc3.txt >> Dantu-Test.Output
if [ $? -gt $ZERO ]
then
	echo $'\n'"ERROR IN TESTCASE NO:"$TESTCASE$'\n' >> Dantu-Test.Error
	echo "ERROR Check Dantu-Test.Error"
	./spell docs/doc3.txt >> Dantu-Test.Error
	
fi
TESTCASE=$(expr $TESTCASE + 1)


#T002
echo $'\n''TESTCASE NO:'$TESTCASE$'\n'  >> Dantu-Test.Output 
./spell docs/doc3.txt docs/doc4.txt >> Dantu-Test.Output
if [ $? -gt $ZERO ]
then
	echo $'\n'"ERROR IN TESTCASE NO:"$TESTCASE$'\n' >> Dantu-Test.Error
	echo "ERROR Check Dantu-Test.Error"
	./spell docs/doc3.txt docs/doc4.txt >> Dantu-Test.Error
	
fi
TESTCASE=$(expr $TESTCASE + 1)



#T003
echo $'\n''TESTCASE NO:'$TESTCASE$'\n'  >> Dantu-Test.Output 
./spell -b docs/doc3.txt >> Dantu-Test.Output
if [ $? -gt $ZERO ]
then
	echo $'\n'"ERROR IN TESTCASE NO:"$TESTCASE$'\n' >> Dantu-Test.Error
	echo "ERROR Check Dantu-Test.Error"
	./spell -b docs/doc3.txt >> Dantu-Test.Error
	
fi
TESTCASE=$(expr $TESTCASE + 1)



#T004
echo $'\n''TESTCASE NO:'$TESTCASE$'\n'  >> Dantu-Test.Output 
./spell +docs/corncob_lowercase.txt docs/doc3.txt >> Dantu-Test.Output
if [ $? -gt $ZERO ]
then
	echo $'\n'"ERROR IN TESTCASE NO:"$TESTCASE$'\n' >> Dantu-Test.Error
	echo "ERROR Check Dantu-Test.Error"
	./spell +docs/corncob_lowercase.txt docs/doc3.txt >> Dantu-Test.Error
	
fi
TESTCASE=$(expr $TESTCASE + 1)



#T005
echo $'\n''TESTCASE NO:'$TESTCASE$'\n'  >> Dantu-Test.Output 
./spell -vx docs/doc3.txt >> Dantu-Test.Output
if [ $? -gt $ZERO ]
then
	echo $'\n'"ERROR IN TESTCASE NO:"$TESTCASE$'\n' >> Dantu-Test.Error
	echo "ERROR Check Dantu-Test.Error"
	./spell -vx docs/doc3.txt >> Dantu-Test.Error
	
fi
TESTCASE=$(expr $TESTCASE + 1)
./spell -d >> Dantu-Test.Output
./spell -IVhlnos >> Dantu-Test.Output
./spell -i >> Dantu-Test.Output
./spell -d:docs/doc3.txt >> Dantu-Test.Output
./spell --help >> Dantu-Test.Output
./spell --dictionary=docs/doc3.txt >> Dantu-Test.Output
./spell --ispell=spell.c >> Dantu-Test.Output
./spell -V >> Dantu-Test.Output
./spell -I >> Dantu-Test.Output
./spell --z >> Dantu-Test.Output
./spell str.o >> Dantu-Test.Output
./spell --ispell >> Dantu-Test.Output
./spell -- dictionary >> Dantu-Test.Output
./spell --dictionary : >> Dantu-Test.Output
./spell --dictionary : --ispell : -d : >> Dantu-Test.Output
./spell --print-file-name -n docs/doc3.txt >> Dantu-test.Output
./spell --print-file-name -v docs/doc3.txt >> Dantu-Test.Output
./spell --diction -p -a --hell -f >> Dantu-Test.Output
chmod 000 docs/empty_file.txt
./spell docs/empty_file.txt 


