function piplup --description "Upgrade pip packages"
    pip list --user --outdated | awk '{NF=1}1' | xargs -n1 pip install -U
end

function cmake --description ""
    cmake -DCMAKE_INSTALL_PREFIX=$PREFIX
end

function xdeb --description ""
    xdeb -Sedf
end
