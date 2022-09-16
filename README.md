
# <img src="https://raw.githubusercontent.com/JuliaLang/julia/master/doc/src/assets/julia.ico" height="26"/> EasySimauto.jl

The Julia interface for [Easy SimAuto (ESA)](https://github.com/mzy2240/ESA) and PowerWorld COM object (SimAuto Server).

## Introduction

`EasySimauto.jl` is the Julia API for ESA, an easy-to-use power system analysis automation environment atop PowerWorld Simulator


## Installation

Install `EasySimauto.jl` with

```julia
using Pkg
Pkg.add("EasySimauto")
```

### (Optional) Customize Python Environment 

If you have installed ESA in an existing Python environment and do not want to reinstall it from conda, you can configure it in Pycall.

You can manually set the Python path with the following commands in Julia:

```
ENV["PYTHON"] = "... path of the python executable ..."
      
Pkg.build("PyCall")
```

Check out the [documentation](https://github.com/JuliaPy/PyCall.jl#specifying-the-python-version) of `PyCall.jl` for more details.

## Usage

`EasySimauto.jl` exposes all Python APIs under `esa.py`. Use the package with

```julia
using EasySimauto
```
Two classes `esa` and `SAW` are exposed once loading the module. Then all the methods in `esa.py` shall be available in Julia. For example, to load a case file and run power flow analysis, use

```julia
using EasySimauto

case_path = raw"C:\Users\myuser\git\ESA\tests\cases\ieee_14\IEEE 14 bus_pws_version_21.pwb"
saw = SAW(case_path)
saw.SolvePowerFlow()
bus_data = saw.get_power_flow_results("bus")
print(bus_data)
```
The example above is taken from [Quick Start](https://mzy2240.github.io/ESA/html/quick_start.html#quick-start) and translated to Julia.

Visit [ESA Documentation](https://mzy2240.github.io/ESA/html/index.html) for tutorial and API details

## Contribution

We welcome contributions! Please read `contributing.md`.

## License

`EasySimauto.jl` is released under [Apache License 2.0](https://github.com/mzy2240/ESA.jl/blob/main/LICENSE). 

## Acknowledgement

This work was supported by the U.S. Department of Energy (DOE) under award DE-OE0000895 and the Sandia National Laboratories’ directed R&D project #222444.

Special thanks to [Dr. Hantao Cui](https://github.com/cuihantao) for his advice and help!


