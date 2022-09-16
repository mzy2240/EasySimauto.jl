# Copyright (c) 2022 Zeyu Mao
module ESA

using PyCall
using Conda

export esa, SAW

# install conda package
Conda.pip_interop(true)
Conda.pip("install", "esa")

# https://pypi.org/project/esa/
const esa = PyNULL()
const SAW = PyNULL()

function __init__() 
    copy!(esa, pyimport("esa"))
    copy!(SAW, pyimport("esa").SAW)
end

end
