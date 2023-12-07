username=""
password=""

question_Path="./question.txt"
AnsFile_Path="./Answer.txt"


function writeAnsToFile()
{
     arr=("$@")
     if [ -e $AnsFile_Path ]
     then 
        cat >>$AnsFile_Path <<< "${arr[@]}"
     fi
}

function TakeTest()
{
   #  for nTime in {1..10}
   #  do 
   #    clear
   #    echo "Time remaining : $nTime seconds"
   #    sleep 1
   #  done  


   nstartLine=1
   nEndLine=6
   nIndex=1
   #sed -n '1,6p' $question_Path

   declare -a Ans_Array

   Ans_Array[0]=$username

   for nQuestion in {1..10}
   do
     sed -n "${nstartLine},${nEndLine}p" $question_Path
     echo
     read -p "Choose your option : " ans
     echo 
     nstartLine=$((nEndLine+2))
     nEndLine=$((nstartLine+5))
     Ans_Array[nIndex]=$ans
     ((nIndex++))
   done  

   if ((${#Ans_Array[@]}))
   then 
      writeAnsToFile "${Ans_Array[@]}"
   else
      echo "Something went wrong!"
   fi   

   #echo "${Ans_Array[@]}"
}



function Display()
{
   while (($nTime < 10))
   do
   echo "HI"
   sleep 1
   done
   #read -p "Enter username : " user_name
}

function Display_CommandLineTest()
{
    username=$1
    password=$2

    echo "----------------------My Command Line Test-------------------"
    read -ep "Please choose a below number
    1. Take a Test
    2. View your Test
    3. Exit : " val_input 

    case $val_input in
    "1")
       TakeTest;;
    "2")
       echo  "2";;
    "3")
       echo "Quiting Application"
       exit 0;;
    *)
       echo "Weong input !"
       exit 0;;
    esac         

}