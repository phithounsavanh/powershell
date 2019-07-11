# My default path that I want to create react-app in
$dir = "C:\Users\Home_pc\desktop\react"
# access the default path
cd $dir
#the name of my project start with test
$reactAppName = "test"
#check if test1 exist in the react folder
if(Test-Path C:\Users\Home_pc\desktop\react\test1 -PathType Any){
    #get the last created react app in $dir
    $latest = Get-ChildItem -Path $dir | Sort-Object LastAccessTime -Descending | Select-Object -First 1
    $lastestApp = $latest.name
    #auto generate a new react app name if the app is existed, incremented by 1 
    $reactAppName = $reactAppName+([int]($lastestApp.Substring($lastestApp.get_Length()-1)) + 1).ToString()
}else{
    #if there is no app, use this name
    $reactAppName = "test1"

}

# create react app by using generated name

create-react-app $reactAppName

# when the app is created, access the app folder

cd $reactAppName

# open git bash, so we can use npm start to set up localhost:3000
start "C:\Program Files\Git\git-bash.exe" 

# open visual studio code so, we can code
code .

