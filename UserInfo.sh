#! /bin/bash

Data_file_path="/home/hari/Desktop/work/bash_Project/data.txt"
row="username                      password" 


function Sign_Up_Data()
{
    read -p " Enter username : " user_name
    echo $user_name
    read -sp "Enter password : " pass_var1
    read -sp "Enter again password : " pass_var2
    
    total=${#pass_var1}
    if [ $total -le 8 ]
    then 
       echo "password length must be greater than eight"
    elif [ "$pass_var1" != "$pass_var2" ]
    then 
        echo "Password not matched"
    else
        cat >>$Data_file_path <<<"$user_name                   $pass_var1"
    fi     
}


function Sign_Up()
{
    if [ -e $Data_file_path ]
    then
        Sign_Up_Data
    else
        touch $Data_file_path
        if [ -w $Data_file_path ]
        then
            cat >$Data_file_path <<< $row
            
        else
            echo "Don't have permission to write"
        fi
    fi        
}

function Is_PasswordMatched()
{
    if grep -q $1 "$Data_file_path"
    then 
       return 1;
    else
       echo "Incorrect Password!"
    fi   
}


function Is_UserExist()
{
    if grep -q $1 "$Data_file_path"
    then 
       return 1;
    else
       echo "User Not Found"
    fi      
}

source ./Test.sh


function Sign_In()
{
   read -p "Enter username : " user_name
   read -sp "Enter password : " pass_word
   echo
   echo

   if [ -e $Data_file_path ]
   then
        if [ $Is_UserExist $user_name ] && [ $Is_PasswordMatched $pass_word ]
        then 
           Display_CommandLineTest $user_name $pass_word
        else
            echo "Username and password is Incorrect !"
        fi       
   else
      echo "Data file not exist"
   fi
}


echo "-------- Exam Test --------"

read -ep "Please choose a below number
1. Sign In
2. Sign Up
3. Quit : " val_input 

case $val_input in
"1") 
    Sign_In;;
"2")
    Sign_Up;;
"3")
    echo "Quiting Application"
    exit 0;;
*)
    echo "Wrong Input"
    exit 0;;
esac

