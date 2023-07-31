# Copyright (c) 2022 Zeyu Mao
module EasySimauto

using PythonCall
using Conda

export esa, SAW

# https://pypi.org/project/esa/
const esa = Ref{Py}()
const SAW = Ref{Py}()


function __init__()
    if get(ENV, "JULIA_REGISTRYCI_AUTOMERGE", "false") != "true"
        # install conda package
        Conda.pip_interop(true)
        Conda.pip("install", "esa")
        esa[] = pyimport("esa")
        SAW[] = pyimport("esa").SAW
    end
end

end
