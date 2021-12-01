#!/bin/sh
# execute this in 'asciidoc/lab' folder

# set and make the root of html lab files
LAB_ROOT_HTML=../../html/lab
test -d ${LAB_ROOT_HTML} || mkdir -p ${LAB_ROOT_HTML}

# set the script file
ADOC2HTML5=../../adoc2html5.sh

# change the all lab file
ALL_LABS=SWE80005-All-Labs.asciidoc
echo converting ${ALL_LABS}
FILE=`echo ${ALL_LABS} | awk -F.asciidoc '{print $1}'`
${ADOC2HTML5} ${ALL_LABS}
mv ${FILE}.html ${LAB_ROOT_HTML}

#DIR_LIST="lab-01 lab-02 lab-03 lab-04 lab-05 lab-06 lab-07 lab-08 lab-09 lab-10"
#DIR_LIST=`ls -1d lab-*`
DIR_LIST="lab-06"
RESOURCES_LIST="images resource source video"
for dir in ${DIR_LIST}
do
	cd ${dir}
		echo perform conversion in ${dir}
		# set and make the target directory
		TARGET_DIR=../${LAB_ROOT_HTML}/${dir}
		test -d ${TARGET_DIR} || mkdir -p ${TARGET_DIR}

		# set the files to convert
		FILES=`ls -1 *.asciidoc`
		for file in ${FILES}
		do
			echo converting ${file}
			TRG_FILE=`echo ${file} | awk -F.asciidoc '{print $1}'`
			../${ADOC2HTML5} ${file}
			mv ${TRG_FILE}.html ${TARGET_DIR}
		done

		# copy *.xml files if any
		test -f *.xml && (echo copy xml files; cp *.xml ${TARGET_DIR})

		# RESOURCES_LIST="images resource source video"
		# copy any relevant resources, if exists
		for res in ${RESOURCES_LIST}
		do
			test -d ${res} && (echo copy files in ${res}; cp -R ${res} ${TARGET_DIR})
		done
	cd ..
done
