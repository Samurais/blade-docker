#! /bin/bash 
###########################################
# Build Docker Image
###########################################

# constants
baseDir=$(cd `dirname "$0"`;pwd)
imageName=samurais/blade
Env=development
PACKAGE_VERSION=1.0.0

# functions
function printUsage(){
  echo "Usage:" $0 -e Env
}

function resolveParams(){
  echo $0 $*
  # getopts
	# https://linux.cn/article-3204-1.html
	while getopts :e: FLAG; do
    case $FLAG in
      e)  #set option "b"
          NodeEnv=$OPTARG
          echo "-e used: $OPTARG"
          echo "Env = $Env"
          ;;
	    \?) #unrecognized option - show help
	      echo -e \\n"Option -${BOLD}$OPTARG${NORM} not allowed."
	      printUsage
	      #在这里如果你不想打印完整的帮助信息，只想显示简单的错误信息，去掉上面的两行，同时使用下面的两行。
	      #echo -e "Use ${BOLD}$SCRIPT -h${NORM} to see the help documentation."\\n
	      #exit 2
	      ;;
	  esac
	done
	shift $((OPTIND-1))  #This tells getopts to move on to the next argument.
}

function buildImage(){
  set -x
  docker build \
    --force-rm=true \
    --tag $imageName:$PACKAGE_VERSION \
    --build-arg ENV=$Env\
    .
  docker tag $imageName:$PACKAGE_VERSION $imageName:latest
}
# main 
[ -z "${BASH_SOURCE[0]}" -o "${BASH_SOURCE[0]}" = "$0" ] || return
cd $baseDir/..
## print the most recent changes
git log -10 --pretty=oneline | tail -n 10
resolveParams $*

if [[ $? -eq 0 ]]; then
  buildImage
fi