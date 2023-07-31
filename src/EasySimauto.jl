# Copyright (c) 2022 Zeyu Mao
module EasySimauto

using PythonCall
using Conda
import CondaPkg

export esa, SAW

# https://pypi.org/project/esa/
const esa = PythonCall.pynew()
const SAW = PythonCall.pynew()


function __init__()
    if get(ENV, "JULIA_REGISTRYCI_AUTOMERGE", "false") != "true"
        # install conda package
        CondaPkg.add_pip("esa")
    end
    PythonCall.pycopy!(esa, pyimport("esa"))
    PythonCall.pycopy!(SAW, pyimport("esa").SAW)
end

end
