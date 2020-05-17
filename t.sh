v=~/.m2/repository/
mvn dependency:resolve | grep :jar | awk '{split($2,a,":"); gsub("\\.","/",a[1]);print a[1],a[2],a[4]}' | awk '{print $1"/"$2"/"$3"/"$2"-"$3".jar"}' | awk -v p="$v" '{print p$1}' > tt
v1=$(sed -n 1p tt)
v2=$(sed -n 2p tt)
v3=$(sed -n 3p tt)
v4=$(sed -n 4p tt)
cp=$v1:$v2:$v3:$v4
echo "javac -d ./target/classes/ -cp ./target/classes:"$cp" ./src/main/java/.java" > compile_main.sh
echo "java -cp ./target/classes:"$cp > run_main.sh
echo "javac -d ./target/test-classes/ -cp ./target/test-classes:./target/classes:"$cp" ./src/test/java/.java" > compile_test.sh 
echo "java -cp ./target/test-classes:./target/classes:"$cp" org.junit.runner.JUnitCore" > run_test.sh
rm tt
