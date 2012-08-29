virtualenv .
source bin/activate

pip install -e git+git@github.com:Doula/Doula.git@ra#egg=doula
pip install -e git+git@github.com:Doula/Bambino.git@master#egg=bambino

mkdir /opt/webapp
sudo mkdir -p /etc/supervisor/conf.d

sudo chown $USER:admin /opt/webapp
sudo chown $USER:admin /etc/supervisor/conf.d

pushd .

cd /opt/webapp

for x in anonweb createweb anweb userweb svysvc acsvc admintools
do
    echo "cloning $x"
    git clone http://code.corp.surveymonkey.com/doula/$x.git /opt/webapp/$x
    pushd .
        cd $x
        folder=${PWD##*/}
        git submodule init
        git submodule update
        pushd .
            branch=$(git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3)
            cd etc
            git checkout $branch
            git pull origin $branch
            ln -s $(pwd)/supervisor.conf /etc/supervisor/conf.d/$folder.conf
        popd
    popd
done

popd

redis-server

osascript start_sessions.scpt $(pwd)
