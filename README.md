# Blade in Docker
[blade](https://github.com/chen3feng/typhoon-blade) is a building system of typhoon cloud computing platform of tencent, support C/C++/protobuf/thrift/lex/yacc/swig.

![](https://github.com/Samurais/blade-docker/blob/master/assets/demo.png?raw=true)

## Welcome
```
docker pull samurais/blade:latest
git clone https://github.com/Samurais/blade-docker.git
cd blade-docker/example
docker run -it --rm -v /Users/hain/git/blade-docker/example:/workarea/example --name blade samurais/blade:latest zsh
cd /workarea/example/lcs
./build.sh
```

Then, use ```blade``` to build, test src.

## LICENSE
MIT