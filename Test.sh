username=""
password=""

nTime=0

function TakeTest()
{
    for nTime in {1..10}
    do 
      echo "Time remaining : $nTime seconds"
      sleep 1
    done  
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