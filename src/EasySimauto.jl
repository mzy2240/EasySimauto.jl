# Copyright (c) 2022 Zeyu Mao
module EasySimauto

using PyCall
using Conda

export esa, SAW

# https://pypi.org/project/esa/
const esa = PyNULL()
const SAW = PyNULL()


function __init__()
    if get(ENV, "JULIA_REGISTRYCI_AUTOMERGE", "false") != "true"
        # install conda package
        Conda.pip_interop(true)
        Conda.pip("install", "esa")
        copy!(esa, pyimport("esa"))
        copy!(SAW, pyimport("esa").SAW)
    end
end

end
