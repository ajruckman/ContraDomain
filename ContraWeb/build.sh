cd /opt/ || exit 1

git clone https://github.com/ajruckman/ContraWeb ./contraweb || exit 1
cd ./contraweb                                               || exit 1
dotnet publish -c Docker                                     || exit 1
