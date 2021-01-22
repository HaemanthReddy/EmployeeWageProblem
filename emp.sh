EMP_FULL_TIME_HOURS=8
EMP_PART_TIME_HOURS=4
EMP_RATE_PER_HOURS=20
NUM_WORKING_DAYS=20
MX_HRS_IN_MONTH=100
IS_FULL_TIME=1
IS_PART_TIME=0

employee_hours=0
totalWorkHours=0
totalWorkingDays=0

echo "Employee Wage Computation"
random=$(( RANDOM%2 ))
if [ $random -eq 1 ]
then
	echo "Employee is present "
else
	echo "Employee is not present "
fi 

random1=$(( RANDOM%3 ))

if [ $IS_FULL_TIME -eq $random1 ]
then
	empHrs=8
elif [ $IS_PART_TIME -eq $random1 ]
then
	empHrs=4
else
	empHrs=0
fi
	salary=$(( $empHrs*$EMP_RATE_PER_HOURS ))

random=$(( RANDOM%2 ))
employeeType=$(( RANDOM%2 ))
case "$random" in

		0)if [ $employeeType -eq $EMP_PART_TIME_HOURS ]
		then
			echo "Employee is present and this is  Full time worker . "
			echo "Employee  daily wage is  : $(( $EMP_RATE_PER_HOURS*$EMP_FULL_TIME_HOURS )) "
		else
			echo "Employee is present and this is part time worker . "
			echo "Employee  daily wage is : $(( $EMP_RATE_PER_HOURS*$EMP_PART_TIME_HOURS )) " 
		fi
   	;;
		1)echo "Employee is absent :"
   	;;
esac

for (( day=1; day<=$NUM_WORKING_DAYS; day++ ))
do
	random=$(( RANDOM%3 ))
   case "$random" in

	      1)empHrs=8 
			;;

	      2)empHrs=4 
			;;

	      0)empHrs=0 
	      ;;
   esac               
   salary=$(($empHrs * $EMP_RATE_PER_HOURS))
   totalSalary=$(($totalSalary+$salary))
done

loop=1
while [ $loop -ne 0 ]
do
	hoursDays=$(( RANDOM%2 ))

# Random function generate 100 then run if block And calculate oprations
case "$hoursDays" in 
              0)employeeType=$(( RANDOM%2 ))
		echo "Employee worked 100 hour"
		if [ $employeeType -eq $IS_FULL_TIME ]
		then
	   	echo "Employee is full time worker ."
			echo "Employee wages is $(( $MX_HRS_IN_MONTH*$EMP_RATE_PER_HOURS )) "
			loop=0
		else
			echo "Employee is part  time worker ."
      	echo "Employee wages is $(( $MX_HRS_IN_MONTH*$EMP_RATE_PER_HOURS )) "
			loop=0
		fi
		;;

	1)employeeType=$(( RANDOM%2 ))
   	  echo "Employee worked 20 days"
   	  if [ $employeeType -eq $IS_FULL_TIME ]
   	  then
      	  echo "Employee is full time worker ."
      	  echo "Employee wages is $(( $(( $NUM_WORKING_DAYS*$EMP_FULL_TIME_HOURS )) * $EMP_RATE_PER_HOURS )) "
	   	loop=0
   	  else
      	  echo "Employee is part  time worker ."
      	  echo "Employee wages is $(( $(( $NUM_WORKING_DAYS*$EMP_PART_TIME_HOURS )) * $EMP_RATE_PER_HOURS ))"
	   	loop=0
   	  fi
	 	;;
esac

done

function getworkHourse(){

	if [ $1 -eq 2 ]
	then
		echo "$employee_hours"

	elif [ $1 -eq $IS_FULL_TIME ]
	then
		echo "$EMP_FULL_TIME_HOURS"

	elif [ $1 -eq $IS_PART_TIME ]
    then
		echo "$EMP_PART_TIME_HOURS"
	fi
}
  
random=$(( RANDOM%3 ))
employeeType="$( getworkHourse $random )"

function getworkHourse(){

	if [ $1 -eq 2 ]
	then
		echo "$employee_hours"

	elif [ $1 -eq $IS_FULL_TIME ]
	then
		echo "$EMP_FULL_TIME_HOURS"

	elif [ $1 -eq $IS_PART_TIME ]
    then
		echo "$EMP_PART_TIME_HOURS"
	fi
} 
function dailyWage(){

	wage=$(( $1*$EMP_RATE_PER_HOURS ))
	echo "$wage"
}
while [[ $totalWorkHours -lt $MX_HRS_IN_MONTH && $totalWorkingDays -lt $NUM_WORKING_DAYS ]]
do
	((totalWorkingDays++))
	hour="$( getworkHourse $(( RANDOM%3 )) )"
	totalWorkHours=$(($totalWorkHours+$hour))
	empDailyWage[$totalWorkingDays]="$( dailyWage $hour )"
done

	totalSalary="$( dailyWage $totalWorkHours )"
	echo "Daily Wage " ${empDailyWage[@]}

function getworkHourse(){

   if [ $1 -eq $IS_PART_TIME ]
   then
      echo "$EMP_PART_TIME_HOURS"

   elif [ $1 -eq $IS_FULL_TIME ]
   then
      echo "$EMP_FULL_TIME_HOURS"

   elif [ $1 -eq 2 ]
   then
      echo "$employee_hours"
   fi
}

# find wage 
function dailyWage(){
   wage=$(( $1*$EMP_RATE_PER_HOURS ))
}
while [[ $totalWorkHours -lt $MX_HRS_IN_MONTH && $totalWorkingDays -lt $NUM_WORKING_DAYS ]]
do
   ((totalWorkingDays++))
   hour="$( getworkHourse $(( RANDOM%3 )) )"
   totalWorkHours=$(($totalWorkHours+$hour))
   empDailyWage[$totalWorkingDays]="$( dailyWage $hour )"
done

   totalSalary="$( dailyWage $totalWorkHours )"
