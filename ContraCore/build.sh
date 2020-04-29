cd /opt/ || exit 1

# ContraCore
git clone https://github.com/ajruckman/ContraCore ./contracore/ || exit 1

# CoreDNS
wget https://github.com/coredns/coredns/archive/v1.6.9.tar.gz -O coredns.tgz || exit 1
tar zxvf coredns.tgz                                                         || exit 1
mv ./coredns-1.6.9/ ./coredns/                                               || exit 1

cd ./coredns/                                                               || exit 1
sed -i '/forward:forward/i \
contracore:github.com/ajruckman/ContraCore/pkg/plugin' plugin.cfg           || exit 1
echo 'replace github.com/ajruckman/ContraCore => /opt/contracore' >> go.mod || exit 1
make                                                                        || exit 1
cd ..                                                                       || exit 1

